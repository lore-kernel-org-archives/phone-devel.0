Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B97349550C
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002010; cv=none; b=MMvj0s2CCZgBi6u+TIiYdJAHf6R8vImC68VxZYu978RXD/K+KMR8bh+DUdKn5PaQq+6tBbxRtAzbk9D7FNCpzjLpWLHqnATKmll3gKiTeEVxHZbQlwEKmlo9l0mCBbRLYJZLXiPLuhki8RAeWg2oQqoVOZBPHRSqiEdvnRlXatI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002010; c=relaxed/simple;
	bh=RZ6L5kG6KnttCqZHYH2jeIzUhBdGGcKDyqVGSs/BMTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=laxBFfg/6HRVa6rjUnnWd4AkCGTNrlPAT2tnWtqrJAfaGGlF83qoDUWj/7KNhDKaVBN38EIBwsGJRvzqS+epOx7b8BmvIoHNi3Qsj+bvJUpFNptm9RHr2R1Ctgbxjx0WfN9TuKINcYxb+mq7VSsBE2NdHfPSuFZ68fkwLw9JvK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WC59cq54; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WC59cq54"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a09757004cso58455925ad.3
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 05:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769002008; x=1769606808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpR/stwl1z8brk4SsorW5KRgaoHVnvVVxmk1S9SRSNY=;
        b=WC59cq54wcnmyqyUiRehjHQiraMhZkPI/UE3zRz24yPozhrJB1wgQRVufedXMG5uYZ
         U/M6VS1ZEA4JWP0e4wQDizNrKBmp61VXMiJvUCFL6P/NyRVXfjkhUEIVtcAAeR3OqbeM
         QjJwn5k17G0rT2RIG4gtEfEyx/U3cEcAEiEd07JUtmoE3FGCy+UrlCUinEaHTi1LEdNn
         51vKzeMdgQKMCy2k9DB0tWN3zU3EvACiHaslPt6GGd4lSjUvSp6o0e4LdiyONmoJ3lgh
         GoJBtGZs3ANCKYNjWuvv/0QzCA0+yjxrCbfggE5Tio6gBjD/BJMIwm4U0vCRpQsBAEL4
         NWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769002008; x=1769606808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RpR/stwl1z8brk4SsorW5KRgaoHVnvVVxmk1S9SRSNY=;
        b=OLFUgQWb1QAyHDMO7KJw/Lc92FSft+SQ+etzIbYszpI5CW1YnVy1ww9VisPmd1lUGq
         mMFTMmL3FCacIjJtUR6yvMeSk2foSn2GCv5N4c1gStvaPq4MP7XPiNN2NlQHUVtTSJqg
         WZ8WNwQEWqdtRD8BdEYlsGVjc4QTHxFOHmdvWfgpM3dbW+Fi16Pw+zEPvzM7LgJ+/mIm
         7P3ycjSh7kOumDbziaYjyMQihdTADP7JdbvlISAs4N743kZQ5CnwVh2egG46MxgMR7JE
         hMRoxpmE9jPllvYxdk3ekRC2n6c4M7EXgP9+ntrwsf51PoJb0Bh5XLBs7F4BLAIFuaur
         Wr0A==
X-Forwarded-Encrypted: i=1; AJvYcCWb2aCcc7teURqlZqP1MtHo8G5tOfRYaH+cTaBeqE55LsbaRyAtV9+PDKQTmUeAO0r3aD+0DQA0mW7qxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZ54gx+TiMuWerSbrzlX+9+VS6XjhhB7FTfrgm/sRIa9p3IKX
	4yymBWCtYT6UpKljCcBGRrLGk24ogEZiXkRyIwDtu0sVWEIGyL6Kxlc0
X-Gm-Gg: AZuq6aIrDtsvLP+a/i8Ig6kFlH/0sSrVDiEaZE8IEL83eydjFrYMF10C76KGti6MUBy
	6VNxI8ktn4IAdyiQSXIuKf+2s2G/6VV1wpDNPwKLG0WxgFgRBO5hEc7x7lsIjKzwe2dnJyRfKQM
	+twkwOqdWaGFK2lUVDmU99cY1IYWsDvsRd6t6Kx2PNh3gZMhXJ9DugeODXvGic2/RqBbehTx6lj
	Ey5OewSX8xxinE+xovx3gSnCU7hJRsRh2vesxpuFz3NnP4uQ/4uGqIyJtJ4YItpVzuGr20yjRoM
	v7RkPHIIsp6z5hQstFGbICroTzkqvov9m6C2HDqNOq+JU7AoAE+FLPZWljYjJFB2LW0VceyHW0z
	8vS0GT/wv9UAknu7at9D78bfGpEVDIDE+A9wScdL5FbjxOFYygBMNRBAnm0jSr2ATcZ0Yt07H4r
	6h1TKOhQz5ZlNDuqRMsVh/ikZX8DM=
X-Received: by 2002:a17:903:124f:b0:29d:7b9b:515b with SMTP id d9443c01a7336-2a717518f89mr159861135ad.20.1769002007797;
        Wed, 21 Jan 2026 05:26:47 -0800 (PST)
Received: from [192.168.0.101] ([45.113.101.30])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm151487235ad.88.2026.01.21.05.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:26:47 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 21 Jan 2026 13:26:21 +0000
Subject: [PATCH v2 5/5] arm64: dts: qcom: pm6125: Enable RTC by default
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-xiaomi-ginkgo-features-v2-5-fb3ee94922d0@gmail.com>
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769001984; l=641;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=RZ6L5kG6KnttCqZHYH2jeIzUhBdGGcKDyqVGSs/BMTw=;
 b=wFm7x5dv3jz+UuxY5G5CpNmEH9BbjfI4Zjwnm6k3n8KphNLpwjvIIzZ7Lk0ztv6aj/S9qSat/
 4+X96ondt8GBu7bJ4cTswfiMFbtpW3LTkeF0VUrpJ4NjgB+zjkgj/u/
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

sm6125 soc uses this for real time clock.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm6125.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm6125.dtsi b/arch/arm64/boot/dts/qcom/pm6125.dtsi
index d0db28336..cb067adb7 100644
--- a/arch/arm64/boot/dts/qcom/pm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6125.dtsi
@@ -138,7 +138,6 @@ pm6125_rtc: rtc@6000 {
 			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
-			status = "disabled";
 		};
 
 		pm6125_gpios: gpio@c000 {

-- 
2.52.0

