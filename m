Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8076D1EB180
	for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943839; cv=none; b=RQMR5Qi2lGjhUpBWa8wUf47I0rNTsTMktpXgnZOLzGHU8TWDfrH733MXXp0yEdVRaT9cVyXZOUXpYKMSKDpF2+yC7iG6TyfM5OVOP4z/gim1gD+sV5W2dG5DAuCL3o6YRWcB+77s5FQJT5blfFkm2vHCWgREYTJfS+NhvlfS+mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943839; c=relaxed/simple;
	bh=Sm5xlwLhcodwPiDgY39BbRRVls11wMnauPuse5tsPBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uc4BOjPCvZtBmK51CLucJ6HCqavYJ/cmmJK1+VVe7NTCDFW/akGsHG9pXvaaKk1C7TCcczAny0gTffwhPEp622CiC44RbuI6lJw1hALdmxtb9IMfDhLDRwIrOFWVg1ZHIvCtyxGxQ/96piwV6N7ClZ6JWAR/ZzVJw/VWEcQBSjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iFs97C4K; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iFs97C4K"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so3708635a12.2
        for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 02:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741943835; x=1742548635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+J6vQaZBbwxU2nxEpFw0lhiNGl2qx6LemoqnB3y8K00=;
        b=iFs97C4KHeK0cW0XMIyqi53qKywzCnN8c85jRNzCoJxmRVTc73UDe0XwCQlzJvbalY
         ftqrFuw297T6VItPvMBb4vimoVESFaJiric03qBeWFNa2hSZkCP9iiuvf3b9LakXZDoi
         0KO4yXaqlwq9Z2y0W259OiHpQzQjv/Aey+cF91rM0YP8fd+16c+sMHrw4tm8pbiRl02i
         4NqcWyJKzkiUcMOB5EshrDrKmeRbPmS8WVgdyYFoGaCcgjaDbT0GcH282uO76cW7RJ2b
         RuodQNpf475JVr0Bc+JMx3BKYRsVVq/jvOBe3uzVz9bhbpBl/UsgUAzT7q/lnGyaOWne
         Wg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943835; x=1742548635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+J6vQaZBbwxU2nxEpFw0lhiNGl2qx6LemoqnB3y8K00=;
        b=QQZLFXlZNSjxGU/EvzHsaNGK7hSCJWh40L/gFMMiT37E72yyMoYIa1voRmQzjOcWcc
         wpHBzf4Scz897jaR0jGRJR1pHuaf9o4tgJ3cJly5rLG29Qq8p0aq29eemYm1QztKD0Pp
         70UdnA5gxTh0SS2WVpGCli6xUDtmTWK3dSstimVMJoDER4iAIL9GUKtKC+BP+SqPnsTX
         Zy4VErKED4I+CnywPdfGDbOtLqEL7noM9UkbaP5uTOIfVcsCgkiowfx12KFoQVrAysfW
         CfurkmnbfjxM4rAMl6nZ3yo+0xEVE+yLfxVwJ+k4aqWHRdcEw3geEl+z1lBKK1OpQB5x
         VZ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQiypcnNIeQwKXxsryY528/c8iRaldWVEon/Wa3bA3798Bw3bHweA5YHllncNKpImCjpYt4XPBKwnJEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzujTbTvgoeQzNQ+Rfhy9Gs9DL62TAnLl+CK+ry+OdhbnJXJht7
	4+3QCDWpQRvuGXZPl98taA0IlutPvk9ZAGgBwt0rtKqthdta+DGoiRBBPcqgIOA3gSMC6fSMeGE
	w
X-Gm-Gg: ASbGncvLm9Plzf455sp3Bn62mcC2fwZCVvEdZOZlVxltHJZI1xxa7Q6B3vLCV4FaI+7
	sYKNTDvrsUiR0jQ2ha1J2OIeQ5FtonjHzMJzlpGDKgYbpPEH9KpQg/VPhkilhN4iDC/NDjvtoXl
	aKkvFuWFpdvSIoh3Br7s6pPdqOa7vJepEpvlSik1Gn71OnxMvIMn74Lv98xyKe9yTf/brH6pY1t
	MRt8F6yqyWp0fNkgPvJtRVr/pEMKk/hkxtdOi3zSmLf0sOT9RQTFk8XD+ICh0t2YVheernLXARr
	Aj+KttubCsxbLdKw1Jl4mWVXkCuwCABR9EpDQ1JfNctLz/od90/9CPqXBkAbT/LBfTT36OVP1Cb
	8TTw036+xi3XB8A+roeb+C40P5QWK
X-Google-Smtp-Source: AGHT+IHA0oJOcUBn44thFYE0L1uY9VB1TNdmNk6qoOLSG1uwio2hXz/e3OOHtr0r7fhxSI46wULg2w==
X-Received: by 2002:a17:907:97d3:b0:ac2:b87f:2856 with SMTP id a640c23a62f3a-ac3303e7060mr181892466b.55.1741943835268;
        Fri, 14 Mar 2025 02:17:15 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm195582166b.29.2025.03.14.02.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:17:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Mar 2025 10:17:03 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
In-Reply-To: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

UFS host controller, when scaling gears, should choose appropriate
performance state of RPMh power domain controller along with clock
frequency. So let's add the OPP table support to specify both clock
frequency and RPMh performance states replacing the old "freq-table-hz"
property.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 42 +++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index e6df0b7dae8baf39bfa7ff3856759e8cd200f0c8..77ca8990c7a096f40aab5666da9f69465f59b71e 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1172,18 +1172,40 @@ ufs_mem_hc: ufshc@1d84000 {
 				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
 				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
-			freq-table-hz =
-				<50000000 200000000>,
-				<0 0>,
-				<0 0>,
-				<37500000 150000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<75000000 300000000>;
+
+			operating-points-v2 = <&ufs_opp_table>;
 
 			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <37500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		ufs_mem_phy: phy@1d87000 {

-- 
2.48.1

