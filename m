Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE95247280
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 04:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760233; cv=none; b=OK6z2Icec+wN/DrBOMbO/4zO6qb1pLcmIDe+/SCnArJAYITa6y9z9UYQMfB9ufHQHgC/wDjnFDTKDNRxcIVLWszWxcrnecH+GM+Rst9Wfq+WKuRqGIJ+KoUrLqB8cPHT+rHi644/7+K2HZBFNidBmfYaF3gFnDGpTvtU7U0PMn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760233; c=relaxed/simple;
	bh=J9Fz7sRtOqzGWUn4OaalbhQscMbkEKJaXUTx0SI3dAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZyhgCkTyvyOcvyytjpcg+tZw4qQ8O3pGF1rmf9BYPOZCCnwD3y1kwlhjMRIejTGh7+4C2TOt6SfyfJ8gF2Rhw6/MZ0gUBNd+8frynbCs5Y7WiOuryIT5/FtUie13n0vZMSK1TkwaRMnuKSS9zvHEq+NufNIGnvSNIcREbbu09I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R18fp8af; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R18fp8af"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c15e8b2f1aso154593585a.0
        for <phone-devel@vger.kernel.org>; Tue, 06 Jan 2026 20:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760231; x=1768365031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF0PSXd7nxzcgib/fF2QxJQOQ3zAiN3r11lfYK9VD2k=;
        b=R18fp8afWgdLQq2YpIcpyl7GB8W+qc5jhai+abXLs2hLpONAo4oe71rXsoNY7nDWJK
         RvAV3YvTozO+pXJ1jju936Lpb/iOZacj9uQT5ewHptvZhCWhonaj8MIdXxbsCXTHktY7
         u5H1n8BXZ6/Pm6nXF1cZCEcTWiw60QYiz7L2KNKHWa4iYgIja6chQG1dkckyCKAttW4v
         hYJVbSTVVqZTg5kVN564rGyeEcYkd+GRT+jhWbQgUaMV1Q7PwDUDpHCNJM+SRIgoxJfM
         feIXTn/EvbeuD+y8hQrgjIhqAOnBuKlH2EGXLc0fyehsFlUVvHbYWuc0SrasmeTP87UG
         c21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760231; x=1768365031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IF0PSXd7nxzcgib/fF2QxJQOQ3zAiN3r11lfYK9VD2k=;
        b=hJ/D4B6S0Ja7AyL86gPk3JsyczbfLoucbnUeXqUqTL/CGXEsgpN5ArliQSDfH05+iZ
         VWkm7gy7H1I4Q4sQitkErdXbGgvY8FZxxlD36zQ9V0CrlauJODha2mxxUlPNhCA/kiWT
         GAmvhdv4IorDxHG3eflmdQ4fe6hSJXytkoDgDyZ44hqA+lFj2ZxWhBMe+EXSgK/huFqz
         St7qjU9tYpoa+V6+G24joh7lkv2GQ5bTNoC0vElNtGvPW+80GAY9rSJIcEJ7x+rXVpUe
         WlXCekY0qpY1Wo36ZOkq0fMd/iDcmM3N0tZekcDro+hZUgowUkBPw/tjTjcHHO9QMLz/
         c2lA==
X-Forwarded-Encrypted: i=1; AJvYcCUv6IJzrmwiAZtPzZoJBZC+0Y6XbPuVCnZiKVvzW2VFV4Xd14et8ZQR29Nnh+gzeCTWrgXJMSpFrKN4Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YystsWVvxN8e7oBAModbn+J58Fz5QP66IxHSyJJSsE3/lqKuO1G
	eCOvu87bQ3aXi6UXXAbjSfg7Y8+hr4+4BUyX4Yu/aaznnQvhcxa1FzQR
X-Gm-Gg: AY/fxX4EMJ74WQ8wD2KVzGqU675ofv0dl7PeNtQE/yNVNPJwFSvRXO0283HBe+JNIq+
	o94ZCo45V3HK098eSh4T7uz/mtWvZzbgjB640qy8+EMwe/f8N2azwjzmOt21UfvX0kzAi5t5NwT
	dw+RPy5eH9KqYVCROVuAfW2NNUDlw7+ai9f6cHEu8/pdU/dFtEOQgHYKTNQbnqxwT1POymImP97
	dfTUxE+QFMcqNCGzB5rlCSKckmaIYFle/sFXYvHGcgn0sKle/hzwV9BSVfAFCfw4EF8M4dBtW4X
	l+GIRH+cB8VYM0TmUTYxx0LhyWWtc9Bq68j+NI1/BiJKjh5uuuIHmu9e3gPAB1wzvBcD4JgEGKs
	0PCh65Fcw5RMrwsbU5oyTvoBiZnVm2wEzj1wyer8giGfYmdhKV3FVHtye/aYwcRjtxp/73rdvIc
	kmUwrFw+CFMXyoKOHcm012Wacn3sm6TB0YAFaUYcMzZYHRs5/Kpfd0eDtlXve+8bemXop61E+GJ
	yE=
X-Google-Smtp-Source: AGHT+IETyC4X98OhIHBp46gznYzJBy3d02/tkM3F4X2Rh0LLVtLU+yZjpl9/TdjSUKepyeyPRAiyrA==
X-Received: by 2002:a05:620a:1904:b0:8b2:f1f3:900e with SMTP id af79cd13be357-8c38941c68dmr155122085a.62.1767760230642;
        Tue, 06 Jan 2026 20:30:30 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6441sm309316385a.7.2026.01.06.20.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:30:30 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 3/5] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Tue,  6 Jan 2026 23:30:42 -0500
Message-ID: <20260107043044.92485-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107043044.92485-1-mailingradian@gmail.com>
References: <20260107043044.92485-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endpoints cannot be pre-defined since dcf6fb89e6f7 ("media: qcom: camss:
remove a check for unavailable CAMSS endpoint") was applied, probing all
endpoint nodes and requiring them to have a remote. There is no sensible
remote in the SoC devicetree because camera sensors are board-specific.

The ports are meant to be extended by a board devicetree in order to
define fully configured endpoints and connect the ports to camera
sensors. For nodes that are only meaningful if extended, labels are
usually assigned. Label these ports so they can be extended directly.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index b8a8dcbdfbe3..3eb4eaf7b8d7 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1776,28 +1776,16 @@ ports {
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
2.52.0

