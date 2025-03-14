Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351191EDA1E
	for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943839; cv=none; b=pe9XKBKpbn7GuyWLR7q6HEBmknjRAZxLP2UXbUwgXBeZxxFnVZyZWL4S0J4V/YmSxfHXjF+1gvQk9lJSygGAj6rhsAuzKNxpWZJvCUn+nQQGcVgji+mgmiRP1CmqW3lod4nHgo+hXFq5MyUZSS/PVncr7htYhEXv1GGPQhw8R8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943839; c=relaxed/simple;
	bh=TQql/7bvMiWWTcBiokJKn28h+W+qXYbOIZNvdiAC8+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AKSdfbZ1Wyv1v9j2x5GhO4PukwxpX7xt8ZCEpLktFmRYMLdLsMEGJ5Y8/nUy13jQuppfMhP1TA5Iv6gZmaCshFiFZVH6pGS48CVC03AgGK6E0WkIjoDuHDExRknfMOdx9l+6IgF4m0gbgU2F3tUZHqPVE9K0DQgidysPFHsZLOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sAEJ9drg; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sAEJ9drg"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abec8b750ebso319063166b.0
        for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 02:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741943836; x=1742548636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EnUUGo2HHQ13RN1/OtPiMt5tSoeJymaCLmfHSf2tq8=;
        b=sAEJ9drgHr3+wBROICba5S4zJQg7ZAo5X311awjDLWBZqkJ9xirCzZjA5gdnNP6/+P
         UQtsEDta5CT3KR9OtozNCTvlAeTbGMVZPh8U5u+BZoe2P4r86KNnzjKADf8O8hcBPbLE
         VTOT10nm/AHDuqa/DNuwBjBYkt5YRjONTvWO9UNkvMmBqZ0iErAnYqobv9AfMdP427FF
         RacKPpMYj4Lx6T8sEMBU4dTaDdLpKuKwbuaB+cSs4xxcsHRxL6asOBMvwWmU8///r0sI
         nJw7GAVLMkJmW4kph4nx/e3N1IjX4yZ/mOXqcp9L7gjbA1+03T/hhML2zQDEWTwNPuEF
         52uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943836; x=1742548636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EnUUGo2HHQ13RN1/OtPiMt5tSoeJymaCLmfHSf2tq8=;
        b=PGMuF8apeh1/AkIKDC2AEIZDzTe0ft0j15aZVGeOi8kYE4/SpFTUjV8RS3etNbxF9u
         JGHSCBRzGBbLUTDX7fFEJ7Ra+4T0CHjYkLwNwqbHCw5aRTxWUwoYgrKY13yH4wO/wAlz
         x2mejGPkX1PCSn5NIHFdNTvKCJHRoQCxK5aQ7WkXKHvj+A3VMc2Ej7oIokR9sJiGvzOE
         FmF55vPM+VH1Zx6De79J44On8hqbT/yp/QwaZPjX5ZbcC2OEnlvPiMN04BSnLPJIQU5n
         YF0beOemOaM3Vr7Q+sqwElYcMy2jA5xvlQfjhObwJbBDRSohhJ2PS8IvjAml1yVPtc3y
         FQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQnThXgV2hG1ob7egIcJnTcyHBFNe/t2v46qh5NEsIUlrNaQBH4RFPbpUu2VhGWm0sz1pVjChop8zX0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4F/DYgoEgXAPf9BybWjpAQmZTpGKxlcBNElN6t+w7G38WzJj8
	RYV8Lo6q02NfdPMMO3LGe4PUj5yTn5yuk4KfrSRbORbwnwtV+LYkaZOs20RR4Eckq68pRuU+FrU
	6
X-Gm-Gg: ASbGncsfzy9oHT03xJixu5gkRODbHSfNZhtXfho3jGKgw9DdM+60GSaSJXWSZZEGyUe
	V8R+SVwwUxR6B0+7BrEM/+HgLI+2eYD8NS14yw/AumUXHBIcWTxdt83IRwgT/8HpSj5xwhFxnZ8
	idmAKxDzuaYGibnhwVjxStsTqNb2Pa4ND92wen2ADBR9KK8mW0QNekRcMHxp4dqMtg70ZtCg3LP
	RU7ZnU7944I2TtxAYymxz6o/LcCXMLY/dzK7uesK3A4dzdG6zEfkGPcgeLnU2yi0ZER+7ElyLae
	ui/7JJfRmOGHzCngf93kYw1A8KSZ9tKN9kHp0sLqU76KDrOwEMzgUQeXUfRZVetqAEfCmglXWE7
	Tvc1uCnzs4DfRW9gFgJpI1GeH4zcW
X-Google-Smtp-Source: AGHT+IGROEW2AOW+QYcjTEvqRULVelQ6EYGyR5ofJR2GdD8rWy92xsCBu/twsCMr/ZtxcA4CpFpYHQ==
X-Received: by 2002:a17:906:730b:b0:aa6:b63a:4521 with SMTP id a640c23a62f3a-ac33018ef75mr189422566b.15.1741943836163;
        Fri, 14 Mar 2025 02:17:16 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm195582166b.29.2025.03.14.02.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:17:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Mar 2025 10:17:04 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm6350: Add interconnect support to
 UFS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sm6350-ufs-things-v1-3-3600362cc52c@fairphone.com>
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

Define the two NoC paths used by UFS: ufs-ddr and cpu-ufs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 77ca8990c7a096f40aab5666da9f69465f59b71e..b26ee8cf66a3f53b6068efdd05ab4347fb175c61 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1175,6 +1175,13 @@ ufs_mem_hc: ufshc@1d84000 {
 
 			operating-points-v2 = <&ufs_opp_table>;
 
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
 			status = "disabled";
 
 			ufs_opp_table: opp-table {

-- 
2.48.1

