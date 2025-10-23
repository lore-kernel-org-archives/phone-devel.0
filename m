Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CC930DEB6
	for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219619; cv=none; b=SVY4Udt/9MDdxCqCtPoR2CG7xZVCKeRtmJ1z6h83WynXHFNn6WEGkSTqsM9XOtsdQPjb4sAR4ww9n5Pj6b99ea4JeIM1tKKEhUExpmNZcYGpKY2rpqZiKyPc01C44EERfFvQwpq4rktaCB+Sh93oC1TmQuZZqet5nW7uKBn7XPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219619; c=relaxed/simple;
	bh=YFeGy6RIY6FQoh3n2HdlAiSUuoO3IjvdzWdiygan1s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnu7NJK5S2TUOaRceoglqryXndntGPLpEOPmZ6ZB3Dy8nnOdfM9yO30E6eMaBiTqVzaGjvACiZR1/LSVYyMD1eV+w/L0tWTE5/1bZNLM0mIEVZjGCbt5zP1wY9rqa2UEvHrZF0olsGt/B0VllcKl6wUDCsOQd5AZzNnVOvChQ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Z81Rt1dr; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Z81Rt1dr"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so1211225a12.1
        for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 04:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219614; x=1761824414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Lcsqgxvnd/Qt11z9KJ6n+cswHFhauw2sZ/mVRLJ040=;
        b=Z81Rt1dr1PFKz3o5Yro3EKb8BsbL7GkRku5FJxRSUidctGag4ryGZjsNXkwHy92miV
         truPLmSmDbQFcRdFe/bG5F6AA6le/NvPkz24qvUNWIwhHSmKuWALO9SNykeY+9Djim4q
         yasTxI1tPVHsi+Mh/XxD6FrEwfsg7WjR1tc9GERNi/SrNsujYpCQCnCqmZKGP6fEJAhx
         51uJEX+knJ0rGlEmMhnpxxTMjtNu9Rh9mJi5aXikdV9xtGclyRtezCTTtniYYcmHnDW8
         hgOwhe0dSnvr9gJaMUmgWYn5AJPxV5xQHnaGqB8TUOT+qGjEFTFk1gBhHPgV+Vn8q+44
         DCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219614; x=1761824414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Lcsqgxvnd/Qt11z9KJ6n+cswHFhauw2sZ/mVRLJ040=;
        b=tuKV2o7LOeIqutKgD2fBVuV342NLSN2CBqJXCK381PSCIvD1iAQjpDAPJRSuBIWXz5
         gveEeMJ4kWkgDlBjfCfYoSJfO/fR7pLsd/XXx1vbVSf9hyP9ZlmT0Z/rlVonvokpTwOx
         fkSuNe+2MefgGvCj/gA12Jr0ry0thc+tpv03Gp95mt+LEbf5GD7n+UJkMBS9kAMxND8y
         2y+9S0arLgE8B33ARq5PQJe0u1698/xwbf0WRPb57MO1WpaOH8XM7EBRSjmrQpSlPJmf
         CgJCewZ9aDjv5w/2sMxZSLvS2QpUqdRDn+dJB1Yj6OdxqKtx9s8emLDuPU/L0QRWz0E+
         /xBw==
X-Forwarded-Encrypted: i=1; AJvYcCXO3RVr/oEiIIorIw71g04cEGG0euY87wYJUd6/e2DZxLIA9pGVDs0kKW1yuDVQjxNUiUlrXTdTD5cGdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUQ9u2GEGiVT975iZcm+8Ph+e1xXese8qmDffUJHN4f9lC2Es1
	959UmuRfTaq5WEM/heRWqmzgnbCERR7AhxenM+4Uc1tFuZWToHZ3md85DwFzI3tFvDE=
X-Gm-Gg: ASbGncs0vSFhPDJbC7KHAQiKokIvnMRmcncc7/49U1eSwENSFEO69Wr1aegE3tJStWK
	YL5wJ0wbdGmi/LsAXHaaAioT6jqa49eIo0yrZCO1N5sdNLoivp3vcGyqNy5BmhIJdsfiGjDZVMb
	7kck8r9loRHDplqba1MyJmmm05G97rZzsTRQfgrebdX+QB9hjqa7nJNrYE/h4UQ6FTmonT4WqQ2
	CXXAwtraVyEcuPkPACQGx9VtggxISseQ3W6xaGktOk4iKTBg2RBkbEvX+2Nfu7Q3X2sa1bE+z/d
	t57hyYyY+0wms2XVVl+RrDq1NmWHdHAUxWzi+aa97WQmvVBQWwtYBe+jBQPiZY8SxlLHEeD3nfM
	eB1yPUQ7AEOBxEeaOOb9hJ8aa6Wc8f6wh5AqSvbvZpCh103vTpr33wrkHXjGqZYf0WjxXb886U1
	oZ+loQDdlLNB0YjJPo78jVamHd0nzt7i85echBb6sBiE3qrw==
X-Google-Smtp-Source: AGHT+IGQoN8cyAJufe4YugUyW8YjG9/T5wbn/mNlO6I4Qw2SpJzK9mmfw4ugdQ+HpO8/mriv57+TXA==
X-Received: by 2002:a17:907:7e8d:b0:b48:baf8:a737 with SMTP id a640c23a62f3a-b64768d5275mr2680084366b.58.1761219614199;
        Thu, 23 Oct 2025 04:40:14 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144cfbcsm192518066b.56.2025.10.23.04.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:40:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:39:27 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm6350-ufs-things-v3-2-b68b74e29d35@fairphone.com>
References: <20251023-sm6350-ufs-things-v3-0-b68b74e29d35@fairphone.com>
In-Reply-To: <20251023-sm6350-ufs-things-v3-0-b68b74e29d35@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219609; l=2058;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=YFeGy6RIY6FQoh3n2HdlAiSUuoO3IjvdzWdiygan1s8=;
 b=4D4XuH1ZeZaMnXUhH6PjI2pOUQDDb7t6oGYOHIdJ1y07+p+NTwDJUQHIQdxuI6BQMz6JYdttd
 52/kMVUVkj1BMcXJJ3zhTyzC61sTvi6s1M6xQRwR2gH04MyO0Nv0lt4
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

UFS host controller, when scaling gears, should choose appropriate
performance state of RPMh power domain controller along with clock
frequency. So let's add the OPP table support to specify both clock
frequency and RPMh performance states replacing the old "freq-table-hz"
property.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 42 +++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 19a7b9f9ea8b..30e77eca4c02 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1175,18 +1175,40 @@ ufs_mem_hc: ufshc@1d84000 {
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
2.51.1

