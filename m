Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380D2472AA
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582036; cv=none; b=cUBC11JnlQ1ICfGaPvKVc4SWRW2ta1V31m3ewbaHZZl/wOOEIC9lu6tSzflMlSTn+z+GGnLx8FODCwPjG4I8LOHGl1Atul/VufEC9GCdYW2mV4LRlNJR1j7wL3ecdLuM2nzdccmW++P21IxbfZB5nYGFXrVtBdTwWVvdQ8dAmpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582036; c=relaxed/simple;
	bh=nIrdIC/aS51gt5+1wCiniQXTQ9R+S1955oLTVv53zdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnbCq0bDRwOnjhaMdmaZ5/sm3Nw9GLvY5PsOXDrrIXFKwIkRbbeyVJ0E3P3O7OebxDH/9qormMzLfVFav3A5daFbt75yJ/nJoNQJ0hLwP5zcd4f6X8706TzFIgdz5MfyD+ysiTTYyK+ECM4hVynIJh0/8zgxwnriIk17cL/4U6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OhYNFARe; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OhYNFARe"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acb5ec407b1so358871366b.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 04:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582032; x=1746186832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2MffYYTdCwNfvkEGR6DdXcGomdgka4CtjmflmA34VE=;
        b=OhYNFARe1Q7n+/CDQPYEn7t9QGvhxWrN8jk3pRmZmb4kC0+TT8Y1XiUo7i2SwY77Jw
         bZ+pBiu/AURrY4N+LtH2fgnGNfEI3g8LajFkczQC2CWm9rCY/TyuXGLMNTQth9r2lkO9
         K0+dzcsqA53MMTTlm+yR4hmi1bOLJPhf2RLgk6wxPLr4YA6NfMuSWgxrtru7n4J2edfM
         /NP2riJG9DXsk4X0oOnP4EbSKFM4BAqskn1jKblCP3EAvr/u7ILmmyrl6OaPa9saa+xD
         e2aotBYcU50t7vAAmd+dLcgquy87UQ95rldyCuFZFYr0zd/hZlHHTx86RtTnWWbcuLb9
         2snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582032; x=1746186832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2MffYYTdCwNfvkEGR6DdXcGomdgka4CtjmflmA34VE=;
        b=fEcCtEdFdvEdmt4/nTg6RoV/NdYrJPoISt7MiYlOb9y4eXX0aOfBN5JCKtfJsEZv29
         v8Y17CX5aWO8R8+9dbeyAMYxVIAaz3AgX8gN0bRxESNMYgQv/R7xwDqPcuQtcHPYcDxt
         IkU5Gn9nJ5Bw6BDlZrW8wLV4U5BD/r2zQ79G78dGEcSk3cX227n8HUPJ06gzmAlNWciT
         OxHiZiWvXqhHwcKQLHmtYzdx3KLgYhj3Cw6yeGQ5sY7SsIICAUl/QhrPbSmAt83y3qhi
         NMchbEqRiLNCYEj2zp50Jd9CTuq9AhLkDJbFQcn7kK7yKiHRpK7O63YGiaS07QqIRPmH
         hJBw==
X-Forwarded-Encrypted: i=1; AJvYcCWbdZLxGJ6NjSFVOG9dFW5w2OVF09uz9SZaUExzA5/Uj9orse0GYtfdyYtbxwhacZ/4j3xSuwyl2G5Yog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrhXngLkl/N+gJ98AtC403825P8CC5aYixU7cbMzmmaEvH8IFz
	/wsPokA7AFuzHfpB5nyURECdrViIzh1yfzrxF2hVue0+5kDDKMmDuefv+QhMLZE=
X-Gm-Gg: ASbGncuQADGxUJuQ0ZvBvLq0ffgmQkSq2l1HMR67uDA38NcpE+nLdYM809hdoF+M2vV
	yRHthg2m/4UwYwP+TMnedVxPEn8nwXByJg4LzMDxVs5O9edf8VuLVnQEfe7gi+yW50VnWgkG6np
	uvDiM1NEs8EX2mfeJG0HM8K7vgM0aqH6VUfrIWVNi5jX/ly4myr4uRKK/dF3mU/qZXlRnltrekr
	R0UDz1p/gdoCBZLoscKtBE2eidudFDiiDlFtiFscTCvwYeJ++fn35sYCS/nlIc20PKdLL/YrCFO
	pYSBwfjxfoj0YyY4qWH1mpPRIkgfqBwgKY5r0UijMn5k+COhUAB54B0OTIdNcwHCyBICfGcrDBV
	pMLS/mUycGSCzT+/3ZAEGUr1JpaPIMhipvwIzYwjLnlLF2MUUSHynswtK
X-Google-Smtp-Source: AGHT+IERqSPQC+gRgsoimNGLFUMQlpsefX8iY+PynWp36058zIqR+bhkys6buYwqIPpM3iwqACft9g==
X-Received: by 2002:a17:907:3f0b:b0:abf:4da0:28e3 with SMTP id a640c23a62f3a-ace710a0e0fmr169716366b.18.1745582032503;
        Fri, 25 Apr 2025 04:53:52 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:40 +0200
Subject: [PATCH 01/11] arm64: dts: qcom: apq8096-db820c: Use q6asm defines
 for reg
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-1-28308e2ce7d4@fairphone.com>
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
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 1089964e6c0d819e166fd5a959f7f1e6fe688d65..5b2e88915c2fdbc1abf635f13537f970ead02cc8 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -953,15 +953,15 @@ &sdhc2 {
 
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
 };
 

-- 
2.49.0

