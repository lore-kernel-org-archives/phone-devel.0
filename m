Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA15253939
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582042; cv=none; b=UsmijlSvZJtkj8jdPt1FB1PdLPJRQWAaJAqTjgDYFIWEK5PrQ/86n0AEa3jCITNu2rMV9T27BdyH8K1eKAILqMAjc3YTwbmL8XGGTCUgkblsAfcfBaefyTiY0YtWUT1lk6DPMnrG/KFOODWcQz1wHAKU73BzT693TBh/WduHoUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582042; c=relaxed/simple;
	bh=mdt+FfQLOXW5H8VB916VcVsQAh5jD9AsKl8jhZ67g9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZW+ZypaxmfKq0dVLqLuzsSTsMSgppE810o9Yz+eWI4g/xjYp1j2hb9BreX4S7VTu/VTEqOCDlTDNsjQWB506EbWnxyfXRAakXoTjPWkSf74WitCVgGRYQMq1+CS/NNSAG3+ZT6e9KqD1Yjomh3QwWWkerH2+al+FTJOVpb6of4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SLpjf20K; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SLpjf20K"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso3576204a12.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 04:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582038; x=1746186838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUVOyxfmwmjXh6E7hIxSYPGnlbPlmO8pnH9O68ZQFjk=;
        b=SLpjf20KVRAeuz2m/cmuNCX17cNJcXGYYzGRDSIy3OkCx1uZ1RdJjCNHcnSl+1USjT
         82KlBEfyIk+9o9lEbRKt3jJZESRhNVcSlol20+/SiGuuMPJjJY+yL+SecRU0xeGmE1wB
         xQuaf5SNPi82+DchFOBT5xbyFIsSgjrbwn835t/d8LAX5I1c5FTRHm2clDjPe0TAaTHP
         sMeVG+DRMmsOaFgQXsPw1N4NXP0PjtOnSZGASn7r30BHNQeEAguy9+0xyR2+HDfylmgn
         zQmVLGd6t7+l6GfrjUdPPmvxj5KYoDTuGmg2X7jj6AY7HWFmGQZNSUTd5nWrhAX3foz8
         vZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582038; x=1746186838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUVOyxfmwmjXh6E7hIxSYPGnlbPlmO8pnH9O68ZQFjk=;
        b=cj0rPc86mDGKiQmdnxZgqq8h6mHqOZykmwQYruMCj6hS9zHRKQbsZv585hQNJVkUd/
         j9/VdWJ899DXwU+MhKADT94QugFwsObt32WOqXvgcIY945qXfreVtvbYbS1X/6+BKtzx
         0tJZJ+pcGaRp2v+lp7wDkNu+kzpIHYCjgtbdCLinHnA5AaWmF3SMprvftLgTjkS70Qln
         bTXBmEGIr9ZijBI+fShGM+vW/Gt1RqVMefP5ikHr4o4fSvoW0kckCydXA7uAh8E4dZHs
         UvFg3hHKlZQmYLDJP9NcB/p0WpT94euOur064dINXPBbUIf0Tv1bgZ1YzSGuj50szQA5
         xBPg==
X-Forwarded-Encrypted: i=1; AJvYcCX8feCo/eek9RCPwqZaOMCRQ4ZlWZ0bW0Z02uGrCJJGWYksU12gsCAQuXESoYDX1naVoxWNUdNmvn3UhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4sGm75871FmGeJIAbH4eexoFEwmqW7vPtvbubL+W/ZxvCbY2E
	JnJyinlCYcxcBHiN7aYloPrbhBeLEq6mPtwyyDzynTT88XjFz9i5dKQW5PyS+b8=
X-Gm-Gg: ASbGncvTgZ3FM87R30hcV1ZxFVhbyX6Sw6O7fOgBb1gReFgz/ceT3ykSyl+VS32xExo
	JhHCzEmHS7/m28ndqTb+5igPGoMAvmqa3R0vWkqoh0/kcjDYKumEXPziRAa25OaGjsnL4r6YNIH
	P9gcZMIW1je9rk7nrymRD8DpGH/7F1i0YClUR/IFWhA08tnlwXpMNBsawKHZHtGa1d7pwDPJd5N
	l57xope52BW77Jhl0xq7NrIvReKT9Hgsl2bmqauuq/Vl0n/aXtXltuGvEGFtc6wbeITb9Pv5z2i
	nbJLH8HJXjB/En1NBySzdgyEwJprrEUPFOd3S4hgPdbUHgcWahXPqQK9tP8aY3MnkDySbsdM+Nn
	s49qYhoyjemUVx1UGQcYDuHwd/VRu2KgrGowuzPZNgsPE7q9uAVZAFx6V
X-Google-Smtp-Source: AGHT+IEIFzywz/urPBQhdVyC9b0OBvVea74eItKR2Wff2NqW4gNd3rRUW/MHApmdlOSrb3j2cNq4hQ==
X-Received: by 2002:a17:907:74c:b0:ac8:196d:2262 with SMTP id a640c23a62f3a-ace71133fb9mr169852466b.35.1745582038208;
        Fri, 25 Apr 2025 04:53:58 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:57 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:45 +0200
Subject: [PATCH 06/11] arm64: dts: qcom: sc7180-acer-aspire1: Use q6asm
 defines for reg
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-6-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index 3f0d3e33894a0730bd0b14738ac95847bd92ee65..672ac4c3afa34011eba6a309148978a777e2fbfa 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -530,19 +530,19 @@ dai@104 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 
 	dai@3 {
-		reg = <3>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 	};
 };
 

-- 
2.49.0

