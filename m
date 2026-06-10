Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938733DD50D
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091569; cv=none; b=QlGJeqBf0wLU7B5xZhNTBavFn7DF1ynN8VLMdRgZiQNFd/F3Mhp2cCTbdlv+uRVg1JSXaMcu+C0XxyOKgzUg3AradNWhdpBwMmbPMI4WKOqc4HKKJMVTbOLi1iJIhFI2YBz2tkeaUbGBxXv//0mR7EG7H7eL5Bs1J4xytbyW8C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091569; c=relaxed/simple;
	bh=yWzPcHOx9Y0l0sp44ZHSshHjrd7t8NWvm/wcwRs+4y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHcDoiyL27T+T/Kgp1fQSXQiFkT/fy+XD9ARkxdMsy4ODN7CCk8hBjQSKMzucUFYSzyjqrsT9m1Ss4YW6DAwabsZTuJ8kD2gzGPAmN/ThIJAMTGSAOHiiFAKf0mWB1cprXlLVFysSJDymlkJQ09rjnObnHh2m0i/l9wWk09OyqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJcS84ar; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJcS84ar"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so4953204f8f.0
        for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 04:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781091567; x=1781696367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=rJcS84arLuPDEGbQ//g6zkTYX8ufd944J15qvPtiApO5xQjyXtn1niYKtlgYqtzDyQ
         XXAlL3T12CUJ2YrrAUIT+Wq0NK7MWMWYE9lHGf9UUPzKlPCdbTwlkYMG/HjeDSyjdH7e
         MtYGsAFvZjOnLiJSL0i9EVM+vy+R8nKm3WlEcpyKacFdeRycJs6fJLXa4VxZMVyXmUo9
         sJIXPwVx7E009a9pAY28DBzTNs7b7E/UhdI3XrJ8EZzFtQqFkrxisCtix99N+GioLSis
         wtsoUXwBJ4dNMX1YTU0VHFcdnTbHANZ338SR7HFJm01/Sv1r9vntm5vvVxhvsIjmtRiL
         XyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781091567; x=1781696367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=NYs3sRKQ9MgYUSOyA7Hl4zIMHKlLswVjUWnvOorTSgFMn2F81kUhAoyUGP0aZq/le+
         aKhBS4dQ+gu3kkigsWkK4f/w1GrBokvyyYiybI9wu2+q/KNQybd8qlSI2huWaAksfGmZ
         y9Gz8kjpkjXVEeVznwAsQiWxR6lpd2CCVRDG39PwNdadwfPDTib4VRnmIxHpwbzV/3pR
         A5WMKKcD2ovH4lPwpx+Zp8oMpOa/lMQaYWxhRYFujosm3294Vgv8xfjlkMHfZPohzNVL
         yi566HEHF1vxJ0gsRS5NElEXMI8+ZusURi/lfb0SiHxIdxzfZNuf1m+nASZqoNOIiVzm
         fJvg==
X-Forwarded-Encrypted: i=1; AFNElJ9LDtlYH7lpJZt+w+g50H/FSloEN+xzvr4MCA+WL9oDE4m2xxAZtiPeuA5TYx6gKNRjDFihPBWoTWU0WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvCT46GerwdxV/yFTpiTRLG2LMeB/1IaDysQP0RsiCM2TdEOKI
	AA3q8VN8x9gobaGjiv1rICXThrXZgJGlGpn35EE/mnJ+nqQPRUqznZeT
X-Gm-Gg: Acq92OHr5ghlFymE9FTT5heVXQ7TPAd4BXPxzS3EEqeiBugBVR39+lsy18zEHTKAIx+
	MgfONzHfYRUlREI7ZdG4j2ur/iF6JOuIDPUsYicnGSCw+j3VTI/UBGM1MwQFZX1oU0yWmXeZL+K
	nvq0fSSOIJk78RZT/SMGPvSN/lSRSKHNEiQGk7JGPlVOJWfEKMHEkqMGeVS0A+MXMWVlPX0DkV+
	UIltH8SWdPdVExp3nJrOH0CVr2VbVGgza3yEXLSbeQbGzHU7QoSsI0KzCFWrbfwnp2dNCy4WVMB
	FW25eCWan5ipZajnqhzj19+o7fAGr/k7FxP/Z8ucgTHEx25OZwsijZxFNEGlv7s8sed05GpueId
	AnaIjuKBRveCZPG1vqdmhjtxYJ7GU0AfRCiRFYNVMZt+DDMuS/0dcT9nR6kHXKRsTNQHAb1VT8z
	hBNeGc3sC3fQGeDYhbcVj5xpWeS3tKvTr0JYBxh9o=
X-Received: by 2002:a5d:44c6:0:b0:45e:6518:21ad with SMTP id ffacd0b85a97d-460302e0a3cmr27231696f8f.3.1781091566969;
        Wed, 10 Jun 2026 04:39:26 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:7c0c:c5aa:32d2:49d:5951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm68042009f8f.19.2026.06.10.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:39:26 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 10 Jun 2026 14:38:57 +0300
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-yukon-eagle-v4-1-763d5698bd2c@gmail.com>
References: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
In-Reply-To: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Document the Sony Xperia M2, which is a smartphone based on the
Qualcomm MSM8926 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..851d1b4d74eb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -99,6 +99,7 @@ properties:
               - microsoft,tesla
               - motorola,peregrine
               - samsung,matisselte
+              - sony,eagle
           - const: qcom,msm8926
           - const: qcom,msm8226
 

-- 
2.54.0

