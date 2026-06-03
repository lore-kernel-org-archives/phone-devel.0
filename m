Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEC53E51F7
	for <phone-devel@vger.kernel.org>; Wed,  3 Jun 2026 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501752; cv=none; b=X4Qe4/hIqN186/I5XrvzOsGoEafi2WnKuo++Ol6B5PwAh56bhGB60nIB+jc1oB527FqTmGY63HScxiXBgdaIMmUtczu9Dspmc1WKIwPMGUSau/9qo3HheIQOSCkUGmZA460shew4LXb1Jx9JNlmN0n5lB6lG7eDyQ8NYtx+pGxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501752; c=relaxed/simple;
	bh=yWzPcHOx9Y0l0sp44ZHSshHjrd7t8NWvm/wcwRs+4y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4SoGgNm6zfilURJvOBaSYrr1EW4LlLQT4LtyQ4rCX2r1rUutvy9NeEQ5TRG0i41FLpBG9P6AeDp5xoJcNyP8hrrx9SY1SqshDwM9u96mz7UxT48Gp+sr6TtG+xGsQh1WFqZgIU64FOEZq13n5exglPzf+F1pSubOpCArDzAV9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o95pM6xt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o95pM6xt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b3637b90so18252225e9.3
        for <phone-devel@vger.kernel.org>; Wed, 03 Jun 2026 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780501750; x=1781106550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=o95pM6xtY6vPEo24o9E6GJmBYR3iaf1uIW1wbwi8XilBsQbtrrvFDNB46JoVzydlo6
         b7vdSzUbR/IiE7xQwAzpIsGjP0nRtlMz9SgY/T1aGsR+FD71QxoBCvNKmKCu+qkUctep
         1oSeHwX6HAeQ6/yVhn8RC5HjgMuffPuJ7kUS0fBZwvaQJirIv1PMpOZWIfL/IHFKn5qy
         Cd3cVHI7wTalWdlnCXudseuxREY1UGfRnAaEzODNdDO1OMCiszqCV13HdazApuyqtlFs
         d2ctreF0SmJxT8cQQ1J2pNphk3m5uS0/fu6Xn6ZTTePfepVq15i5X0i6NoNkQOk5OeDX
         zHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501750; x=1781106550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=VsR9zZKMFiu3jEh1sfK9UmAMURLboKuUzgk1sinMgXc8XP4DKb6EmomaBwYMJm7sOE
         Pzckny89VGWMEcY2ROX1o3Pgk6hzQB0Abch1S3RGJRlB31NUuPCtswpwesrJ4Ao+9HxD
         h0vyyqbUjXFg3dD7HuELCQZ6NDm++eu3WkcolAiabv68yReVkvdWkyAQA//Ib0setKRf
         j5192YqccFQm/7eFtzo98eQ63cInKQeKl3wJSJ9zKwL8W1SXhT/Vx73Zck9dilFiTlt3
         ajAAAYbI/+dxDwiDe0dLVKj5VmorrvvABeot8ISfmifgUClkx9SrEaK0xIJZ6gRFDYr2
         U0uw==
X-Forwarded-Encrypted: i=1; AFNElJ/LHVtH6M8WndsH1J135jjNs9sWaXPCJPs0Or7m5YI64AtvHdruthyFJl9z8mXbv5NAiWjzRVxafY2hUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUFu4rOMXq0/OpUIOVcAmC9zFvpzuoFIWi2tTmKPXcszTWg5cp
	JctrF1nvSUigh83A2zUBu5Qe5UNRIq46l1brC/Z7ogdbMIaYj/tPZKWS
X-Gm-Gg: Acq92OHihumDevKNBvb1DvZ8kcvcaVvbsQdvuCQ4E8M6mYDRq7QeZyYQqUmSiblijHZ
	+QvSO1N39bDGf1z26/DkprEXPWE2Zuei4QDw0hy/3zh2s4X0gWtsVc7CjPU7VWo868q8A/TSWUt
	MHCIL4PrVF0S+LBRZhPrPEHQipRRnzMLdV19ACq0jJj/ztoTCti7uvDh/Wy6pMxaeSFPtk7MVPt
	GuWR1AglAvFh+xfGp9XrazBl1OjKjQ1lKijEmqNGBkUXpukbm6cuw1e2JvGCbpJyXzyZfxaFy18
	4687b8y/sf0lH6WCckuvb2AQjjLuw4mFyOT3QHNiGKOZQbpT7aJKOLfqAyLX1sdWBV5mCdf1KKi
	C8JmKuDTOVbMOUEqLyx07Eb1xYC6M0aoWZO2UHiVqxxGY78Z58Ytc7RmmH6msDE5Zwtw02LTnPG
	wHpCmlAZyiHHRRxxVZpP5eAJueTFcdBKAGW1X5Tg==
X-Received: by 2002:a05:600c:528b:b0:490:b297:89b with SMTP id 5b1f17b1804b1-490b5ed6482mr79101105e9.21.1780501749614;
        Wed, 03 Jun 2026 08:49:09 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:43ff:9a39:ef13:72e0:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm8886008f8f.4.2026.06.03.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:49:09 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 03 Jun 2026 18:48:21 +0300
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-yukon-eagle-v2-1-f86b440583f5@gmail.com>
References: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
In-Reply-To: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
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

