Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444532E11B2
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843402; cv=none; b=pVLN5PP0PLEyO6mXC5CuLnURe1VqnlVYJM5GVvPdMe/PinpRXpFYvTyIKQScL2zJcL/ofbt3Updy471yjVhHd9hsfTj26fv7fYRdthNYDMEnjahRaPYqYyBF3zBPRTcbMrs+1tAY4QQIzAJxlUQGsMFhWs5kwkIQdIM07Hd3RO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843402; c=relaxed/simple;
	bh=C2JtTvyb4AXtbDuTYKqVJriQ2UbwtZ/ycgN9VosRmWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQ3z8+LjXzlfV2+rgFHV9y/Bkv+qo55zGHPkX2nh307c6LC2ybPohSnNT5L909MO/pt+dHCCW9cwKJQIPx3/aiZhn8qYpIDxFXxHN6u4QN5jcV8JoFX3aC08v95FOQD5kCeNlwzic2TMGhPC5sf1XhKOqON/bGDWoGoxfBYiMoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LvydARHx; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LvydARHx"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6097de2852aso1765309a12.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843395; x=1751448195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbAxlNGNMBjPB368qsF4KlT8ElPeOLO2pW0abGoJlYE=;
        b=LvydARHxuzFxtCfYscyeGvnu/FsA34ENHBLug4havR/GAfJjtcgjud1oswyXYJEGy/
         18UVrovKSP7pci7iUFXIBsoy7o297dX//je7PPKjyGig3UQLEiXTAKzM94dvClfXnKf/
         eNAK9I6SOsIKRVnDXQ2qByOHUGY7tkhoEw2QBjIj8xH7u2y+T4vAelk4B0bTp3ZQTYGR
         oUNxVEexRMVH20ICaBFC/TsJ1eEMZzFU72nIXwPnYstPl7+aqLvx1Lyanu3MU8gY/acD
         8h2Ili+bwlMoAQjEDVMcnB2H4J5nnsyfbvXTIMnWk4VISDwG3x7W+Cv2qKPetmsCXpu1
         8Zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843395; x=1751448195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbAxlNGNMBjPB368qsF4KlT8ElPeOLO2pW0abGoJlYE=;
        b=SQKkWjbC+Tpo0rxeVgdSLIVTRnHGSY6I0jbLWyL3IhC5PhBBMcMTE2/Yl0Vl3ZTK4z
         IqMS4Bad2/4UNmlvOkJAPRvKoijI7nhColBfRMDHl+XBBzeD2KM/lbB2vwW7Ny1WExEO
         +NvvEiwqPPz86/M+/QIcQuHf/6M2hAfNpjk9uIclLP8p6iIm0y0B1myHw9cMTYamstrU
         zpb3AxSHOpHYhhPFBY6zkT3S+Mtmro29F5cDF8I9jL2akrNdMmfQztuV+64+k9ZgK5Oe
         lRsswCIYM7y29GhTfmUd2fKoCEVKLJmAajOjNj98th8SwgJc6WoiXbCVJbaRuTmpjbaB
         nl7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNHbNd3MYnw1HkaPrBBtvBchM25at44PY+PKkCjUQ2Iy75wfJq8/D64INzPbkVRsuJ6eexa/VY3CEF8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNpnaxtb1hFn6Q71MHy41W90zwXczwGJFBw0KkpyxLcsU+hJt9
	ExcktXUpX55PFGbleYHiz/0xQSO+9zVqubSuptFT98rQAJ8LCo5l9OLky5rstWT2fl4=
X-Gm-Gg: ASbGncsncK0+8uXR1ozO3RfTubiOZ6Xd3vLRTQfoUc0MYzvp7i2N1r4TIpLx+QrNNU3
	DV9kb0zbnDYp8OlWu+rjIQaEs7ppIaSawyolxSWACE+Ip2Hil3Vxkt8WBib0jHI1fUEtw+R+Zrs
	mgimenVSkajSGrbt1h3oLKYjoR0oMtwi0Wz9DBCujFGfH1BezgMh0U9fxc3mdxHT4/LT84Ynf2o
	h3tsgwV47PWZ6DBdR4UxDxW5kH4cVi6coXhaBZ+ajPRHPLTWBn01yYidzc6nGb6j6B9Nu/klbzp
	lV9K2UU+v0ozJnirPeMASOqYUgT/uIwmZ/HY0uOkzz+qeqxYTQysNJqJ2lP0GP0I2yKu882qumu
	A0ZIOZcLk1XJtVIJohOdmyHeC35HAiGKg
X-Google-Smtp-Source: AGHT+IH5Ea6Oe8g4N7kGjKPuq2Ehn1sdorRYiGI7t0sOOA/sE5jzxQrPTZnHeS3tOTzbYiDpRieahA==
X-Received: by 2002:a17:907:6d0b:b0:ae0:c539:b89a with SMTP id a640c23a62f3a-ae0c539bd16mr168789366b.19.1750843395300;
        Wed, 25 Jun 2025 02:23:15 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:02 +0200
Subject: [PATCH 07/14] dt-bindings: soc: qcom,aoss-qmp: document the SM7635
 Always-On Subsystem side channel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-7-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=902;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=C2JtTvyb4AXtbDuTYKqVJriQ2UbwtZ/ycgN9VosRmWY=;
 b=NfoI5zbKRHbMeTR2sEabxYna1BsVoqMJWG6yk0k36XGqnYtuT0/2sUxemlmo/hi6+elMefc19
 3axPadbKyacADeOKyW5Iv0bjZ9mnmTelUfPVfAa3dsIc/MTy+uREFd/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Always-On Subsystem side channel on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 41fbbe059d80cebb214317df8ae15b86573546bc..24f7536ffc5ab7489d252359f3061c8619f1eee5 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -38,6 +38,7 @@ properties:
           - qcom,sdx75-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
+          - qcom,sm7635-aoss-qmp
           - qcom,sm8150-aoss-qmp
           - qcom,sm8250-aoss-qmp
           - qcom,sm8350-aoss-qmp

-- 
2.50.0

