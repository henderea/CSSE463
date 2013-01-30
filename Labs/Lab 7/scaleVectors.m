function out = scaleVectors(in)
out = uint8(in*(255 / max(in)));
end