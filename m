Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C6630E0F6
	for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219619; cv=none; b=TanQyiC9P1UXa/PplSD5dAHNG8voSXilbLUMNIOcnetUE3bpJbGklfWvpS8uVSdVSRUeRgVW7HywaYrF5ZalgEoi4KD+vaN4csRTItFAwsAxDzg2VpPbFH7ZQCqXxe3aGziHp4tYGVtfJezfSc3Wqw3tDHJeAfoNuW51gPT+AvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219619; c=relaxed/simple;
	bh=p95Yod17aguDEQvaEd9jFzyjpv3eP0LhnfZGpsw/x/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bK05JjKwuOpNBWzzl6wqzEhIwJ4mS6dmtlTmwMiPVgt1C/cphYEX6GCCRoJyaCWzy78jl/soWF2LDJo/dEiYVdxk2HB/L64CM6O1XhBzFuvdAbx3Zk3UMClMZy//3ZGRTUhvm24ChLN4XLOE4Cd3kITLqCm26/Zp4l5OEUYABBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=P1jE2uct; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="P1jE2uct"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b457d93c155so147549166b.1
        for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219616; x=1761824416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+b9aFICfN/XZyY8AY2ox+ovxPQcHAuzzYqvvmhyVWUw=;
        b=P1jE2uctxGdO+kePUc/sjbLYT+tCK7n0+p+K8mTdBxutivs7zkU+ZmgCnHuV8NofQQ
         Dk/VVd/uCtHDATVwRgQlsDPdYcQWMETAJl2UJi3XJTfDNDOXB9y8oqo4kWtaUL042X1E
         YNPPWnnxHllHhA4McpymzyaZ9TKRd6kMyjOLIwHgL84uWkrUdx3/m4X0uyXGoCF6kuxl
         AsE3midRPo2JOsU/SV38sjyAuzZlje19lUcdsDb3xzO8d9SEIcPReJSdQMauAcYqvlid
         RXysQgXG4P/usLZuB8GnvOf0LEESc/CJ7o6Slt6SFYlBABU3Ds6ifJ+4e7rIYRrTJpiu
         N34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219616; x=1761824416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b9aFICfN/XZyY8AY2ox+ovxPQcHAuzzYqvvmhyVWUw=;
        b=dnpzt8hfLOE//8k7Q+cgtLvq3kb2GifWu7Yt6wHpVWoHHOyHOLxeD/k8FtOm05TmU6
         ve5rL2YnKQVyuOP1MSIZnxmNjRMkCkSPPp4s2Tt29fzGywM3QNbhPHyBlXHLWfDAnQlf
         hV6hpzN1w5axqGpeitX9mfLWt6CKDVtJ+vTp3KqhUXSVYTSGw9Qzxe+PsyVTviiHLkL+
         AF75Iwt5gX1WjQNPQq0pPcAHVRI1EGxS3TSfUuvrcd4LYmQNiJwqqxCWfBfn4tNJjfKN
         9GdW+BZlklCket2rpcm+cqQ4FS21hOnuV93MoQ+/LqM02ajZWTE/GRucbaWm1Pr8tLux
         +qTA==
X-Forwarded-Encrypted: i=1; AJvYcCWeb/Etj4FZCHlMVu85R/69zjgmUove2dK/n3bkpHMi4stB1/oA+JE0vZW+503FMrU+i4h6vvjsMMK6Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMralGvc2O7Tvf7GyRJH3VRB5JDW9mWLeHhORvRCUl3hURRJq6
	73+VZIVwr+DokXl0acQIH1Ez0+CfAKUD/tHMVDShKtNjcJdANFrQJ7C2IAVT+kOWDao=
X-Gm-Gg: ASbGnctuKmwqqOiTHQwwuS3mquOC52rsDSQVUahkpRtLtmANYZdufqBvSeC5d8SGDWU
	3pPi2gRm08t0aBOBHqZ8wiKLQ1TwgiET3UbByEHksRRV6VjD8LwbsRj6mGw8atR+7qWHhKpt+dc
	CRetpeqVwydbk/fHuhbLOesAJJhxGVD+JX0riDL5bnFT++MiG9CpbF7GvBUqVIXH5FF/nulceZ+
	CIHPdNHzeR+SX+ljLgeDYFhEMBjOLIp9/YZ+Q8+8ZWG7/ENL9AFf9wnUsGF22TH/UDtcWa+5Gv8
	hxKZA77Q0w0L5PIT7VJKO5/lBm2dGOWZk6yUu8+XDsXdFPDvBSY5fsd7FzebmdBvlikTwrgSF7f
	Rk66jZzzfVpWXH8R0ci4WLAoW1wkaIjT6Jc+YtRUuxVDFS26KHue20nmXOwX0ocvJ0QERyHlv5B
	jBiFcYauvrH6yWt0HXO3COJtB0IWB2uLIzA+WiuW3Bjk8ZaA==
X-Google-Smtp-Source: AGHT+IHvDD9XJ1vRSH3cXt3DI3SdXcHBMF1NFxrmnD8Bb/1OzLxNUSC4bWEuB+gxH+suooNl8D/8cQ==
X-Received: by 2002:a17:907:1b15:b0:b48:4966:91a5 with SMTP id a640c23a62f3a-b6474439497mr3315552766b.30.1761219615642;
        Thu, 23 Oct 2025 04:40:15 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144cfbcsm192518066b.56.2025.10.23.04.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:40:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:39:28 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm6350: Add interconnect support
 to UFS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm6350-ufs-things-v3-3-b68b74e29d35@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219609; l=1043;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=p95Yod17aguDEQvaEd9jFzyjpv3eP0LhnfZGpsw/x/I=;
 b=287cSFqIZpBinFoMzW/Pd2lFwLD4usbtB6bd6jWXziSDY0JCm4sfCEqMwGA3nCItJX7zjP7Ef
 J91UNtGS+N8CHwYp4HrQfTP5sIo5AzXnJ+P/BwWvV/ljlpPM7o9ijaR
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Define the two NoC paths used by UFS: ufs-ddr and cpu-ufs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 30e77eca4c02..01977d692755 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1178,6 +1178,13 @@ ufs_mem_hc: ufshc@1d84000 {
 
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
2.51.1

