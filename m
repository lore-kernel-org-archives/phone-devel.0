Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C764A30AABF
	for <phone-devel@vger.kernel.org>; Fri,  5 Sep 2025 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068871; cv=none; b=HlqvR26EkQPohJ859dP9gFTIlYEt5K8UNelbaa8ukbGDqY1ATSjcBU/kcrKhZnPKtiSQFMhReJLuGck0DNiampqe9HkoXgCos7gSpAxZx6MjJ/8qpuSzlV2hoBB72I6R3ZZQKGCvPX6lVRVtc58GVmVFHilZIQfVU7Lon9i6Uok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068871; c=relaxed/simple;
	bh=xEZQ2DP+0xmVOtTUyk0n7mNgFjGNQdkHGCz5TGjrLY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P8zIgZG9hMmkQCek8ytIUnsNbW7egqx8JKb1BerrZsdJW4mF64CvxY4jUTx78EB9UiJZjB3yEjsGPwRGu2/RxElckEii59gATiELP5pg6ii+YcshI9Sra8c9a/EkHoPaY8bcWsMcn5n0ZlqaJMkZ6NHAWryHOKT2AXLVaaTEBVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Q0hhARJK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Q0hhARJK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso21822405e9.0
        for <phone-devel@vger.kernel.org>; Fri, 05 Sep 2025 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757068866; x=1757673666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1rvQZQxLwmsRnPml37c1Lfi5R0CJr98kBiMU9gyfu8=;
        b=Q0hhARJKtDduuOM++E9K8JShdedFgklsuGWTdQ8S+72wPzMCiWwXFUFmFY2ioGS5S3
         1ApB3bKmcqftSDgwo264haM1Nh4HLbthC8muLPMPpzrOVwGg79YS3qArGvrZOEp26U2+
         sUiX0BSY7MA7RCsCJcAMp8nymUIZDZzyMo6poflCTQbHZJv0ahLBr4q33j79d1i0UZ3g
         jKpAO+7J+tB7fuh79PMK9hC0jtw+/hvEyoUXlBy4gAKbpEJOeJkIGREwxc1V4CRZ1LwI
         wceV15QnwEQgg4POUN+Wnm8tStou0bL1RjdXLlih+JB10FCQIc70pOuAd7pCRforHZC+
         amBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068866; x=1757673666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1rvQZQxLwmsRnPml37c1Lfi5R0CJr98kBiMU9gyfu8=;
        b=nDEvAgbKcvTJ4yPKZTxoetNdvPRu7km9u017LnASBDEHJafrlLm6T3vR33cCcKc6Y8
         fz4+LZb9W7PkNwSKKZkYSPgiBYo1K7jNR01ag6g1dxvPbaIUmJ3naENDQuZRACaSDBXz
         D98gtSMSHWyZrtuhkqFXk9XO6Sek2BWpKrVem5H4WBH5sTJ84adX9/ROqRxo/pehPyqq
         XCfxKSz6fjTNFdlMeRWW82boU4OiY45KdV+Sc4saR3cMkOndcmNB7sorMsegnLw0yRLz
         Oby74EieoVS/QT+OsVzcNlxdk/MNVe3+yRbWUau54Aae/sBHV/ZQa2tcTB9hL/l28dNi
         xuLw==
X-Forwarded-Encrypted: i=1; AJvYcCWrzh1KphEkfgwm+vpve2QGUmfQDDklKGs1NyAHamVCtaIv6tHVDzLPtI9AZwHptqaZbmszljwb/lyVRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0jel870Q0TvapKuMIWnD36BSJXfVNlgOgX7EcDvuutXtffMS+
	MRZw9w6xAH3ho4ypiQfh8eYNY1XZ5yg7dU19mmBLraHQm5X9z1xxfsqqCbs7LnJQvSg=
X-Gm-Gg: ASbGncvXeQaGD0HkC908ea6LhP3Zribe1UloJHTtMeCCXZLRhb16Uuh3y2TNCQrp5BM
	iR2NOJ3F5VNHhp1y8rUNf8vNCWpjJovUJ2Zc3IH2VqUJZcXed06NCrVlr+pOM3Kcl7sPN4bbAtI
	b0dD3OgvUGC/TEy4141Sz34OF7YxwrvLYuTDPnWOeMJLy81U7+QQEeRhN5l8X7UMdIx/MH1yFOz
	wTePltkgJ2B3zGLott3kXSZMm4+cJ6QslDqtgBpTywinASYnQqnuKt2za3cX7eDsZSFpl5LGqz6
	2HIp+HMwgkaHZn7WlXn7W0dKhAcuTTqac1ablPS7f4sFhnkAQ8NVBoVU4t/TZcZ2Xwz6t6/VNk+
	biWRCUnyZtnW9RtgHPsbVqMFRVUUoHo2fDZWRZ7D5llPGt54EiN0Oa4ZmyQxnfdhL4IopSQVUVe
	J2S3FcQlQxuJ4rLnOE3l+tihVJy/8zIg==
X-Google-Smtp-Source: AGHT+IFIuk0QBVF+N8cmk094clxzhJ4H7q4AzYcSgacFq2+ob1IqwwEgeaHutExdzNR3cASZWiUeOQ==
X-Received: by 2002:a05:6000:288d:b0:3dc:15d2:ba9d with SMTP id ffacd0b85a97d-3e30463df0cmr2266019f8f.31.1757068866016;
        Fri, 05 Sep 2025 03:41:06 -0700 (PDT)
Received: from [172.18.170.139] (ip-185-104-138-158.ptr.icomera.net. [185.104.138.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm20990738f8f.3.2025.09.05.03.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:41:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Sep 2025 12:40:34 +0200
Subject: [PATCH v3 3/7] dt-bindings: qcom,pdc: document the Milos Power
 Domain Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-sm7635-fp6-initial-v3-3-0117c2eff1b7@fairphone.com>
References: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
In-Reply-To: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757068857; l=891;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xEZQ2DP+0xmVOtTUyk0n7mNgFjGNQdkHGCz5TGjrLY0=;
 b=NjgjfvDq5UjS7i8ksrCpgumVPl316Un9DA2C5ULUSAe79FSyGV164Wjf6IlnP0bB3sye3THyL
 vPBrwd2qGQ4DqkyA8E2ISIlwJ///87lFFBwCUWBWF3YyR4N0p5Tq7p4
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Power Domain Controller on the Milos SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index f06b40f88778929579ef9b3b3206f075e140ba96..3f90917a5a4dd9d068ec472565f5009690ea2c5b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,milos-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc

-- 
2.51.0

