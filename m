Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687183A5E96
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 19:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986239; cv=none; b=r5HoTitEsmd6Tvt2kQCt7oojyS2+y7GtRr9s3BPNP9hEHK2jYNeKdxRQHq54pNI8ECQ5e++d/B5/xSYSssICDR9dFNMjTSyQYhou5QssSdEAl+9nGc6DcGaWTVLA2xiu+TdBPlOqlKheKPySp0EXq4lCb9fIO/IVWqHiJ4h5574=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986239; c=relaxed/simple;
	bh=CAjUME/AsJT8A/Pl3H28E0ZFy9j0BTNKFTGVCJ4aUUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/p72ES1nXHg7klB1kQ1V5mDGne84G1KNDLxwh6v7KjKDQInOP+Pi97wANKSBXAfUGN9Xhu0bZw8Guwv5K7zyamF7MNQBlJbksNMOY99yD5bSehk7rffHBe26dzx4kq2VkZYGtqnWlvYraOTCDkf2NqyzJHz/FdhZdFWDbj/kQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dP6gLtul; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dP6gLtul"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb38e86cf2so655948085a.1
        for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 12:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986237; x=1775591037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGH91dl4ZX2yNvM8AEp89yLHvfpni10RrWd7dl5M2dg=;
        b=dP6gLtuln/IZSDxo/kWBz41QZgJX+/7sqtBbwV2cuAq5Bf3rUGfa9RR3xsbDVDNldT
         dW9EDRPEN1z2WvWV/ONGSS+68g05llkuZYMKIZ2X7mLaC/oJ7MsqD4b2GmUQ9H5Jeb7e
         dY+F3Ceekmur1iItQPwgX62iErJBCiCTEwtzbNmz6vyte+CLQvs+KEgUBncoco1PHWlo
         rpeIT8TbW1X+T8t8ozFZGIji+pNZ+EQMb7CCXvEfeeliC1TIieJ75LQtZTl/jgg7MlEH
         EcI/au3Hz/VAIIi0GojmhUArTherpYcPeaRAdmhUeDuiz5KKm68aoIRTLFbndJpmsG6M
         vNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986237; x=1775591037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGH91dl4ZX2yNvM8AEp89yLHvfpni10RrWd7dl5M2dg=;
        b=ST8nc6pHMe+p1yKF7fI+SKBvUDVYlfwh1Yk/kpx3sHEErtQnCd4t45x2ECfNRMoYWy
         kL4tcb9dOWFX4aLa2c2Vc8uBnHmf21uTQF/U1Pec9xcSnQ6WYOkEhkeszW9Pw9TrAhBr
         WVXGOUgL/NxB8UPtL33mIS6eIxA3yS4ilWVqnMmDHIp4Qf39DrZydxLIYOcyJKlhyz1I
         1Rf/Vpc+Jf+a7xpXhcL1oNLsweEhDhub8LdH89WR8WY+v6f1ypS+Rm7mzryRrHLb884R
         OT3TQCu4GKcJC1Pg0oZw5wwGVaLunQtYW+tw3x1H5STr8EDc933mE2spcQDxmInlXb8s
         ZdYA==
X-Forwarded-Encrypted: i=1; AJvYcCUP3KuGpY/kVmFqQmq0K6oL9Co4Q80B9nOg0XDrhXMjx/RYp5kEpNZSzS6WLXBm5RYaFaCDWnR0e2d+5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIsUPVI46wi9zDC1P2Q7o7NOC0NrdIo67mA1ZA6ErwOArS6mJ
	4Mftuf6V4ApvkRQ2gNXL1HQGTByo4VX7y+3T0fPDH4M9oyyw8IjWARGA8pCPeA==
X-Gm-Gg: ATEYQzxFv3FKPXVI9npekd7jWuuZbyyZOZ51J+XDyxmWxQwqj43kPAiKtqf7EoGE9Wn
	DBsoe288KsoG+OCQeXdruPbRnASQM5i6AF57MwsTdc65PdA4m6Nih1jc2lpUAs3V8PF9yWJYCbv
	7lj2uda2jB93BhqPCRfUJpFGGM8W9heh8VT+lK5B/+uJlG3N5o+5B2GYClMmSVGFVf0Bq5vwKMx
	NWG6/rvU4LG6TvkJmRIubrbVQ9ZNvcL/7YGKSzZbGntmBxzpuDCA17U6ivj6ChrMm2TwzGFIOS8
	bgYH8u2thQyXe5mbQpnVPTfKVkuyRTWlEwxPMnXSjTqHcMQbix1bLDKhABBZishjyG5scuqASxp
	RKw7kWv0jYN9VNclU98V+u4/UCwhTVurll5Q0lzMtrYMI2FG5gzlEkSRHtxLadtnptNy4F46u0U
	ypxhVzjkGRcCEOcbIZ8XKjcJFc
X-Received: by 2002:a05:6214:19c6:b0:89a:649:f88c with SMTP id 6a1803df08f44-8a43b50f422mr12425006d6.52.1774986237402;
        Tue, 31 Mar 2026 12:43:57 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecbc9e086sm99969476d6.12.2026.03.31.12.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:43:56 -0700 (PDT)
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
Subject: [PATCH v12 1/3] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Tue, 31 Mar 2026 15:44:35 -0400
Message-ID: <20260331194437.41041-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331194437.41041-1-mailingradian@gmail.com>
References: <20260331194437.41041-1-mailingradian@gmail.com>
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
index 746e9deba526..fbd16b1f3455 100644
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
2.53.0

