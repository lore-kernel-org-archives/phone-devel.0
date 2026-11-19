Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107267;
	b=kBLgd7QQYV/SCSdpkkaqVkLAn1rTzXqhSlCsYm1ZesAIifkwl6vrEHMEwXm5UKCNPS0d
	 6Hj/mO0L17G0iGvzV54NmYgXG8SRlLFwtxiXIRf84YlyJC1UAXQr7LRcU/mgGYoEv1kUO
	 q4ywYREcyYKLBa0GJfFHPPvJuiz/Db44rQeifNWxrfTu7L78OEFQXo9ess7p4PPMSEar8
	 UcUEE4jD91RD8LunFvnD5hLliE0K6JWOfik4xcpYWbXlnKd+A14TbojSw3QFVKq+wA7v7
	 86j7qQCvDy14OJXvfrDL6rA+PwhD6xpockAshwmllPwWFADMnIX/4tPbsQbg6TEYySg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=qSdDUbY+R5vc/F/hiotaSRUny+MyAxoBaFr2nd3GaCMsS8JFQWUmKRKmh4KQLpghtp/r
	 Oz/o/mKG5PpJ8fY6G1gqVJ8JeA03/wiDdSE0UIlmbhIxP1cfZ7Aa/UY0otOb/uu/PsZa+
	 feACrrOVEOKZMzIdVzZkGapZCoWJVXGlCbkIO4YMlZ2VE6MPp5TQiIECg6G9oBQr9kCMV
	 KM+GuCDZut/QTLw62OIpYg5PKnGMKfevKOZAzpLEYKbBedPlFIIfHbf/0HqPltNResgcH
	 LYBp6kI3Svlb/OnELL0CBcKD3uudmw0lTH0iY4THXtO/3lx3lwQMTUF4kYfVdxqnZUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMU5F7pE;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359E260A2601
	for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 359E260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMU5F7pE
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso28041495e9.3
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107265; x=1795712065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=yMU5F7pEic3WVSBK24VbKUxHb+6uvJTAIVgjWdxbMw4XrPOaSJE7r91tNCsliqQHaC
         qUZ5AZm1wcdjhg5SrKK/Ip3xFQeC4WH3EWfuhKGt2XT4qXNdxGvhP4n4JZToUqxlS8Ow
         I92yF98dqmRTf/ArtA4sBnN+AainR8sDe9FkRY0ZduALSURpwPh14khnTslQ5LzzN2NT
         wgcHnaSFPMaj8w83bxuyS0gTYRA9qb9F8740IOKVqC2JpoJaV55hh+Ddm3gPRJLYGvse
         aP2oDAyuagJ3p7ACBi+M3SSu54fU1v7T73M9/axItnrn/NlR3Y8jwyws5kkRF8YkbAgk
         QDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107265; x=1795712065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=ubZZL3QY+VAddQFAprttlIsxN7c/rhEB/dTrfLRk8IrCiw9rlyOxC6sqDwgNXanECD
         /KM5UpxVFw9EmzAgV1lXmgN3TF6UOHRiG2zzsRBpUFA/bF7hAS8nvBF5dvwY3QROWGwZ
         2v3SuhnHtMCpN18FqAttEuYbN85Cs4VDVVcLGu8otQ6YqDB3MYiBbDUNzvZ/ftcdt0HY
         dQN059GxHjH5LGkeIH5d0K6VIKlL2ZuXxiI2HSa4jmAbatGDwt5JCspnzLAOYRCJpid7
         /IvM6Z0zw63qTOn5WtoKB9JwJCnLm36qx5vNEgi5xH1KiDruwCIdYBeLA6/k6Pmln9+x
         1fiQ==
X-Forwarded-Encrypted: i=1; AL+hErHFKBYCIEYP7sIQEIzcvNfwAqKD/lWjNIaqOSs4rMvhAO8mi8yzR/aW7L241m8GSlNX5VfMk5ee+3Fivg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jtKV6ivC7BycMEljmdM+aapxrOlE+p/svujSNsSWS+0v/q2SL
	oYRTY4oG50NhpFpPLY8wI/FIWqcBuLvWnwWCnmmGzE0MogyeSuGWIQtI
X-Gm-Gg: AYBFou1rg+x0biqb5Pb230TjKczrGOZShVKStwmTmC8yFD9sehDXkzXD7d9co+TwRnE
	4NwMRg2T23g3N4frYb/wLmL+C7buG//VuGEw44T4JLVC9kJfh7bMRZMxl24/SfxUJ7Hbok2vaz5
	kxgEFr4+3hFL4V+1ELm3/k1Id+zb4QaYm1jE9Tijt1BVfDBDgzgkxvxAGlaXnaxGh/W3cqU4aaw
	vdl7jS6ej7VErq/Gpr+jcYH4mvb8OQAUTYFiL89663dO8uZODHXBxiM5lpEtXE1Xn/QlVMvHK6l
	+XB25cXLxNIMnkJR/zkeUll1OVHOFKX2gUUQO0Q5BJuWNpc2sVhRtdl5o2OMdthUhIZzAHWL5np
	bqh0b71kmBW6QsHtaxQyN1Ktwisl3WTidQKMtNEORKgu81wqMGZqJSkYkG0UoHi4kH/5RdEaA4u
	BSDJzBgZue+4VoLGKsApYzGRd7XRQIf3e0FWFHXsxa8nAh6LOPjmpGvkK/savMyRIlNutPwJyWb
	1ULvXu70HsKETgxgyAS0+eBVkPRfrCOi6ovTDoRIWUH6WiTfyvv/yHqgfL+zQIcpPZ1frXrWUwU
	juSDIdbcLzeLJdV1bnOdXUU0xDuisBDXAzUpDG8Yz+WGaCKV+cf7wxhlfp59x6P1ppHCRJlwZac
	=
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr1876395e9.25.1795107264467;
        Thu, 19 Nov 2026 08:54:24 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:24 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Thu, 19 Nov 2026 17:54:11 +0100
Message-Id: <20261119165420.24466-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

