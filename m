Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE7A233127
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568456; cv=none; b=eee7Rt6tGmatOcIufmiq7K+kQpzG531IAcH2G7SRt7JdBtzAyTBdCTZ3jV7oMGwO33/cGROW9NrUIoAJNy47hbkAqZZmk1QVHRpOAVLokasCnrYpHzhGiao5Y5lPLOZwavZXeALHYQMBqX7diBIZa6HFmofiwdNsgttlhAu8kRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568456; c=relaxed/simple;
	bh=4r9tJ+EcKTSeTDqTruse8d4E3SvZHkJ5ztPCJLWlUSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vol2lWwXz4nTAIylDEAxI2ibx69hwNUyrcpkD9hs4oE6OnQDmXEDsX1ExC4uClVFxut5aPIAeT7Vod4f1/imVRQBRo2aGym70Qpn01hICwu8DhZmzsgNYvhg5KLYmUB/bmfOgggSkBH2XaOs3BBoXM/uGiC/QVHmUTIlDdt27cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hAmJjKIo; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hAmJjKIo"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c266c1389so1328685f8f.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 01:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568453; x=1746173253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=hAmJjKIo6hrty6Ia4dd+Hx12AtnoAWlBrMlJN4qqI/6fFypkKSN2pfcNP1xOumrSaO
         CLnQQKr6hZcPLEvbGtjTFrqKmVmDq7Xo8Cv+VOkyeV21csFzxu8BiH/ug0r7+TO2Qcyc
         DFKR6fUnVKKubyYnpB8nd21I9/sjdYRacLhulEOXlmZJ0pdeLcyFAAwm9iL6l8CWPRH7
         F85qFr1U44FNEJSlnatmW/1EN9ZWij1j+fjCvgXc5YnFZPku2wumRbKPV5htn2aBke9E
         Gg1wIEYj34s6jsQPwFy2gi++Zx/Yr7bjPvJZk5oe7NjrsOF/02lpbXZ2V6GukGC2m/Ps
         lSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568453; x=1746173253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=f0ivB6PKdZC02YWgAABni5UytWQoEvoKLCLHzp2ZXsZChYAf1Lk5OQAe86XP7QJR8m
         Pp8ii0DNRFFmZHQQSNEvOIdTIDeoI3cv38D+RBSG2fyto04LXHW1tMz8Qwn7ywqvEX9C
         t0wdnFeMQ+1ByE6QknuAR4FQ3AUJleETfqSTduqERqks2Y3ALYnzf2Sg6Eu/DEJivjlZ
         IyjwDsnffdsMOOFaitFfh2FvWKzLx1KQA8Acxnf6Lh92NwvTQkL7Jhnyxki97MWJx73Y
         hfAl+kCcARrFivbtOU7gdbfaKSl9wlYgvCasiQ8oqIhVWALmY6TXtMNu246bHf0ABZi5
         d5QA==
X-Forwarded-Encrypted: i=1; AJvYcCWjlMFw+T7Tt+OwtSuyFXy7vEMloFiBETq5NmHRsF0Gz9ALauodeiDxNyn/ZDF+tgq1Gv/YL7mPS+ndTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBt7xhIB70Nj06D01LIeIEeR1/5urwphDeQvne2yIE1d+sxsD
	+C2Ou63V3y9vLx7S6ATXUlmtPTF758cH8Nm4sA04YKUDlcvq0KNAqqgtGyvQEhY=
X-Gm-Gg: ASbGnctwUBPAm8NKvmED1S4ZznlknyAxmLdZUZ39H4VBnokPp8F836smLdSFGt1ltaW
	0D3xcYNE520jqVk2HeTQXiospA3aPuRc/uIydxbmfWh+8uOSe4KOzGZYInt3k+mMpOsMWaCZOk3
	j0ihYvWAte3u5XwbczKCldpBkdDZF3s7I2bM8tvCZjqBeWtkRghlhcXSxn4VdjV+BmQLxbrKdxL
	SacFxhigmJLFFAGpavGHCOqVm41AIgmUxjBN3T/oI8fWvjG+UqFvH1XmtxdI6FmDyyqHp7BHXcn
	FTzv9DYLVXa8bO498SFvKd9eZNM1K2F6tmgoC8ybXsPBwyQ+nICKgBC8Dz8Sj8tlYNDSQ/OlpkH
	lNofzDlMkTpLiVFQa6NKCRQ8ZTfyxWOK9Vtw1aS+36tw80ZVwEe1KM+gG
X-Google-Smtp-Source: AGHT+IESPkwoSXL9H158Zipa+9IfMAIxHeKuyCQjlKcULNXaCkr05UQj4rmsW9F9V/zyF5XpgSj7jg==
X-Received: by 2002:a05:6000:2485:b0:39e:e588:672a with SMTP id ffacd0b85a97d-3a074e0f0c0mr971220f8f.7.1745568452582;
        Fri, 25 Apr 2025 01:07:32 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:25 +0200
Subject: [PATCH v3 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-1-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the bindings for the sound card on Fairphone 5 which uses the
older non-audioreach audio architecture.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4e208cb7f6c61adfd4b687227038d275f849480a..57f62a228c262f38e703816efdcf443355052619 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.49.0

