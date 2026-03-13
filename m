Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74233BD634
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417647; cv=none; b=bPTtURehDOTi7WACCScZ2u0Ycslw0jtbvrySf2Phn6CpOYCIy6EfpIb4JbTOEFcKqpf1RuGh1KLuJHn37pFY8ObI6dtHjSmJ9E8VsX5PzkpDO4Cu83LGCqhqXzbYGX2+VwCA72j3Dd872PcNYlKht6If6H9sfawZYB9TMVQe4dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417647; c=relaxed/simple;
	bh=u2HFQojXGX4R4xf7AuyY+WqykoxATSU3T3sviOlK8TE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCDeXdlas+L3SetAAXfov8i9V7XkDTQg2hsy53Xxn+o/2euPxjaAey6QL+oDcBARuK5frt232wEvD0gfd7WIT727Lulla0swK+hF3ASKCSKvkywTBEPVwZvs+d75iU0ewmXJLteGflBT8rukwdcItNfWwlhp3ICX1y+f5qz/cxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NpTAfhz6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NpTAfhz6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6615c461d3fso2374237a12.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773417644; x=1774022444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VoyK/eV0axN3PuzlsvqNP6/uR8w8URq1HoocMfUr5Y=;
        b=NpTAfhz6SIvRqLlYmzEdsOaY1hSy0DoWoA4je64nqVmR4MUUfFfxz0tk0PsJgliClf
         fV093D7nKE+hFyDISd/puyyIcV457QuokZQs2oytuxPORz+FVAD4P8n3af/aw+vaDpGD
         z/NoLdgJhXVVMvdFQK7nrT/50sT1J78I1ttqTWYP2JaoY6RbtDjWoEsi13joL+tFez63
         AYgkaiR+pbo9hpBg63/EwV1XXnO90lqi8T5/7326XOqngyYkXGraZjpGJD/0lKQ3if2W
         Q6O75izerJFFqYbRLSnWhc61lwvMR2WAE2SAy55gbMGXqRYsvsxo7RK9Va7z4WsUPmdb
         sNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417644; x=1774022444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5VoyK/eV0axN3PuzlsvqNP6/uR8w8URq1HoocMfUr5Y=;
        b=FWyhIZgyx/ZExysKOXHzPr08bgT4SVjofpF9PBK6F3/icls+w5RB9TEiPJ9/dXwA44
         C6F/bfcHD+BwhRu3DWtMmgv7JtUXNqOuZ381eQUDYSTX6iIzbgkShnKf5ODXqAcGo4Ij
         /Ud0Dt2vTwMyCy6fhRtB+kNzNfyJht50pLEW6a93/tf7ERyhnhJkquZc0/ydnZhhE9+v
         LQxtteDjObRKvPjuG46PE985Yzr/mx/4YcGihMrywP3IQ2ifgy4jlDIfI/uy27Na3328
         VyJI4uulGjG4rBE8rOt+zb9mgxBVk2Pb4OeWqwYNaxM40CxYElGE3kNK+mpLrjg9MAtC
         RFew==
X-Forwarded-Encrypted: i=1; AJvYcCXMNMsk3oY1ZCPI1L1jN3gvx3A/xMgQAJ/445Jo8UPjvwvQPClDnTP7PqrJzgHW/OG1Y67TgHaUXaNk3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YydPCBuo9WS8jL5w23FGEEDh+A63BP50NGfEYsMxUu8igvnoP8y
	x6cVgKdwv1pmtGoLMLusx1mJC3ntCacsxtPpxrSXPmATkEXAS1Gitccd76/f5yyo4NI=
X-Gm-Gg: ATEYQzy/WU7AQuYh1a5BD3paFBoM6uHjRTiLqrjYrpepf+lWnTti7fCYo0G0zOMbaJ4
	V346NTLcz/6ntSjAeunvMYSS3IqZ/JVQLrhf5cSgG2Lo0FjD7MOvv0CTy6VXV80tYZcanOePuOG
	SC/2HaNkylOmwnuruUVX8ap2UZWreEYcNSL/t96oKLj9XI9Cvao7oQpSo2ZUefcjqAjNNawxyTq
	29XlD8mgSSjsRAsYYsB0+MebgRYhkVshKKikVrM/ijKQBBi6vHM17NtMN1s9aB0SN0ognZ1Zo6H
	BclakhIqqqN57wkasr4/v9jOJa483FdXKgeLuBFbwf7New6oH2/dLCmHE5Gbgz2L/ET/QmbouVd
	2f1eIqF/cIa6YR39dCjJLZC7JimCZ3XH4mMN6XElsA9pqn23BZ+7wOV1mDNvHCvD0dLOak3a7/C
	zQOfplI4SfQqWmAGDjrUcvgETNuPWzBtkwFbrFXLlAs6maARdv8wgHUuI8dSKXQWqbmA3WZhh7T
	VidT6d4vrxDb47V
X-Received: by 2002:a05:6402:f0b:b0:663:4965:6b9d with SMTP id 4fb4d7f45d1cf-663babbe171mr1684829a12.16.1773417643802;
        Fri, 13 Mar 2026 09:00:43 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fbb94afsm1397100a12.4.2026.03.13.09.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:00:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Mar 2026 17:00:40 +0100
Subject: [PATCH 3/3] arm64: defconfig: Enable S5KJN1 camera sensor
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-fp5-s5kjn1-v1-3-fa4f1c727318@fairphone.com>
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
In-Reply-To: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773417640; l=634;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=u2HFQojXGX4R4xf7AuyY+WqykoxATSU3T3sviOlK8TE=;
 b=9XWr43PWDzY6X/dY3A15AymbSG79hW+kPEIL1OIu8sS3X0H8+LRicligqezhXi2C2b4MzyH4+
 QwV87qEG7c0DUrTlJyq0mkDAPqKGLs37ltwwlez9STtrhbB+GgxjtsU
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the S5KJN1 driver which is used for the front camera on the
Fairphone 5 smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..0457618a38d6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -943,6 +943,7 @@ CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX412=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
+CONFIG_VIDEO_S5KJN1=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_HDLCD=m

-- 
2.53.0

