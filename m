Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D8747AF5C
	for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 18:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572558; cv=none; b=JpU81WZrqRzz81tcBaRzj+6lb+AG6x8N9gEMURup76EZ7QDmOCx+zenp22wBs5Or03BqAbWcNIK/YMj6rxoPgtpoBMP6abwTJbvQnzPUI9nQIAeOjuk6rKDZpabtBnnBuVXsA5NqZxFcyvBsGRX6/LawZ1dnhlHZcNun7G6otks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572558; c=relaxed/simple;
	bh=JAhrZ/4Mn+RhFswy5xhoyabVuyMKqw6bv0r4qG4kack=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evgCQY2iRwPd2r2rYuNi+Ml8WjsCImGERUxDa5QNOy5Jwlf5PXUXiWfLbXJstUl/lz8QP7D0JqQRRFnfsv4pdCWk3by9NzG60rRNxuh4w4HfneDm2+gn/JoK4LF9+BUYoXgJlnz3XSjTBCQpDk8o7/UCk5HlWF51QRYUtDy8V9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJBn0IzE; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJBn0IzE"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8f0579401c4so131325885a.3
        for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 11:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572556; x=1778177356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bai4xpOLUuwZmx3Zo15EDRauBF5sX3Irxv97VKKrfgI=;
        b=HJBn0IzEZHd9cdIcNCtdmUH6yRRUqj1C1Nj8mVLYsL80g2Oo9GMuRWxmt6TvY83J5c
         z4gmu60kEtGn9NA5zugAeVS2vz8v3UYLxM2laM0kud61QtaVuqs37hiDkAjxxTUk7j9d
         s+1w5ZPHwuIgGwrNcpEc1/C+bTxYttThXKXTir9hWCYemYDJU8jsJcMdn+85WNhleaWY
         h1Sgpg9q+Wn2SHecxWlnm8VecpIMF8Le7zST8Ezniu34ofMIsRZw2bz8jpT6loXiV7fM
         2tOmk+H/7n5LtUUr3yublvdlI/0wWjvO8Uwy177MjbYSXeki1QLsS/YqB/pXPyv6bquE
         9+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572556; x=1778177356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bai4xpOLUuwZmx3Zo15EDRauBF5sX3Irxv97VKKrfgI=;
        b=eABnkVnz4jtKcSyOosxVQojmN4zG78DHfNgSEWoNUyHfr9BJ+qbgZyQC/q9kLYJrCx
         RDyCERyV3+7S6vKjm8l4dDnaD90PjoM756799geVdyT1zRYGIdUkVCjfSRtYm53fZ5A0
         nElayz6S3wltgcKxXpezW/WoS/LRU103HKFqHubxkSHomKvMwFF5q5XIxKjIpI9tT3X/
         Ify3GYGnHheopGu0glLNqZ42tGOPlMCuv4OF3GpAHSZNCG/cVmoA4tz0pQkF2nLYVSnU
         oNtMr40PWvAUQUlYtn5bnYNlVMPfrEUzL855TYuAg5E3iCcqkWUxKx4S/u5AUblUkJU+
         Mygg==
X-Forwarded-Encrypted: i=1; AFNElJ/UKSy5U05OIFj3lpEKZl4u7baC1COVtrwIRQUfyIjx/t2wjbhb6yiyH/p+t3zQ6J6vz7LIJvBvVr6mgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpO2TjfcHf6zPjQl/tmb4dOEMTFV2evo4fQ8dj+DgHZqF8kQ3q
	JaeFTd+Zb8/hVGFSfQ7t1Lw5M1i0mO3QvMDQxOGgEdlaLxTF7Gsx9gFh
X-Gm-Gg: AeBDieszY0UHihbppuxv4Gq9TsYqMIyowTnwTdjyzgI6R+/4VJdLMzhvHePR0dRn7yT
	jFh/W2nQs032P4eJO86zbZ4wRQsiZ3hfhUKureg4jbOWUIZNRel83q54rstFauN68nPKoywdPq1
	HUWZJ5/WQzuz/Ixd2vcUPQvJZgFMcRBtLTKbHjqrykcZzwkxCbF6slVnX/v5wBY3Jv8pBvc7cAI
	tzvIvKWUgu6WYyMhyVKBEmiZ0vK+Pes49yk7YhQ2qZ4vDZ139O4t7MTkGQ/hhi8qlrYnZdNBb70
	3MM8DdiwbSk4E+Y7q21aOxtDeStjHu1C2Mg8i9M1s2UCun7/RnwB6ur8qkJ90+DI2rshv4sM9p6
	pcmGNiFtz1oMJnH4hNEjVk0bk7y22kNECuLBAsR2n2LHLP6OrMXGdU4qSWRUmRcVAHAyFeI4AIf
	Lx9OU/9GZc3IBNomSN7s45ChOdlAoblLMJaFiXStb/irLXRYn3HLCuzM54PeaG1ikvXiokWbSg8
	QW50FhvirgceQlv8wrq/qjyhw==
X-Received: by 2002:a05:620a:bc7:b0:8e8:93a2:217e with SMTP id af79cd13be357-8fa889439c1mr609409685a.34.1777572555920;
        Thu, 30 Apr 2026 11:09:15 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbb3e2b668sm31637385a.35.2026.04.30.11.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:09:15 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v13 1/3] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Thu, 30 Apr 2026 14:09:59 -0400
Message-ID: <20260430181001.9256-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430181001.9256-1-mailingradian@gmail.com>
References: <20260430181001.9256-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endpoints cannot be pre-defined since commit dcf6fb89e6f7 ("media: qcom:
camss: remove a check for unavailable CAMSS endpoint") was applied,
probing all endpoint nodes and requiring them to have a remote. There is
no sensible remote in the SoC devicetree because camera sensors are
board-specific.

The ports are meant to be extended by a board devicetree in order to
define fully configured endpoints and connect the ports to camera
sensors. For nodes that are only meaningful if extended, labels are
usually assigned. Label these ports so they can be extended directly.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c195c79c1c85..1613c66f92b3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1787,28 +1787,16 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				camss_port0: port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@1 {
+				camss_port1: port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@2 {
+				camss_port2: port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.54.0

