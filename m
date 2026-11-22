Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374490;
	b=lTIq9XhYS3rLFMFYWKNN8LS95D/RrXf00+LfRnqItnIxYcUEuNFfwUUrsVF3qnEWJY9w
	 lbHjZtGCiRqvQz4nnrzBYjdHP5cDMqjdj0BMkpooumP2XciglIaZn+f3WRQdwoLILH9hU
	 9JumYaAk9yaz1C3ZmC6iDXseaV7NitjQaEI/c3ahoSaZN8JCsa20/lxoUFVGmebrLWtZN
	 p2U86XJemrn2pp7UUNvbnHjg8RdvE10wBJ3fwl/bYZrGyrc5wnqrXaRB2EjJNediDUSWT
	 u5DYh1WAL1NfsMylCqe8qb7ngb2qB3x7At9rVJa5rXLKpEg5Sf8oo1DWlQk3CMSbANA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374490;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dnzfLbez8bec2fmTk67DwQeIcCCDBYG4VAWtUYKJVbg=;
	b=1RczM7vTNhTiJXZqeJPCPDNyQB+lZCWy8YpER4LcrPb4Tk7lrO7wk7JmbzN8CkleFdwY
	 u2+lrwWU3xA9dOQN3lq18MmgYYP+R17DAbx8azq+P+0DlRpxx/8r5uEH87NawLw09qDYG
	 ZPwNlx8FZIwo8rBZWFzWuDuVlGv05jAp2zBQveRz7gK8BE12FZ1ed2h3WwZLnI7vXSKOM
	 baxjmzZ/6ISrzfqTgvp8CNd4bnPcBzuaLSfd8QGGRD67Q0YSypqlgT3Zu4MU3BvXEFa4S
	 +96GpnigfJKqW+qnQzfh2wAFWprmmpOlATxm9ju/T4o1p3zzpGUS9yWrU1l/wh7FnGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlQ0zWCY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A45606A336;
	Sun, 22 Nov 2026 19:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlQ0zWCY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374490;
	b=Qbufe7w3BCvNPVru+jFYMN1K+0nfIUCb2XsPI+bwz9x1CxSUnYD2M1Mg1jjeLEahpS34
	 bb7j4tXhiprS9K2iRxLkNfank5EibhGTobQVLue7qU+vWkJJ+mG5P9yFiOznqnU2RRbQH
	 H6CJpGxnv7ywiHuzMxdGsh2zbzhszx2nJZ5Rd8FDYymLmgmDm4RIkUFW2kmjomCGkb70L
	 5nuR6jXqSO6eE4UG4bg31+pnTenaZipz/pZZXp5HGnfUQAiwI56fjCG2eQoMCaX4a8wST
	 02UoMqP35dar2hpo/yRFkl46CKAcZC0mNq0WE3ZVf1RwLyQEsmHR0CrV1n7uUv/OXdA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374490;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dnzfLbez8bec2fmTk67DwQeIcCCDBYG4VAWtUYKJVbg=;
	b=YF+L2sh2Dl/psdjNyuwE2LTn6chnN4e6qWU7zpermSuJQ2zKnJW/NKYLsW0f1LpHn0fd
	 pYqOg5yp4uCp1OoJBnxfpcxLdYYUZ9K8tLkD0fa2GdUGCDT8uni8Kyg3atn3QlLKzHxtR
	 k9Bc4kRjvQDlPZN0PjboP3rNPB+dY8PYMcv8Y2B6+RWXQ2+11ZinbF1npKkB/4Huj0ujd
	 Q4ztI4skwZ94PJOES9aO2q7EJFdG6GiM6xyRuGa48RZ4EuCMCrv0L0jSe1jpQlwe/8ioY
	 oAayxvTj3lWqS3bhrlGqHX2boqO1MuxEG9tzZzNG32vwOasvz18MY5jEDJxYTgq4Zjg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D38941F000EB;
	Sun, 22 Nov 2026 19:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374490;
	bh=dnzfLbez8bec2fmTk67DwQeIcCCDBYG4VAWtUYKJVbg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HlQ0zWCY84Lh9Yn604+Agpaq8B326FDjKb9m8QDTH8QKIUXsauxpBASb1iXhbQl4q
	 1c3eF7fNOUZpUMaeEppKxagGoklpF4VheIyqvZjA6N2NvUXI1YMv0WXVS29dGhDCnT
	 52FlDgGtqX4JX74ku4xI0kVPDAKfVzfeej9+bLYUObSJzWtaXss2gQABh/I2MaIuVQ
	 nKEPgtG3AQAFQHxPFC9sW46CeRtduImH9+IgQSRpbaJDv6paZwR4datMfVjDefww0x
	 9VnAO6rpnNAxrv38nV74ph4nJnUce2ROGMnfGoict5YGpZslQ//wdL4YR2TBQ1IKoo
	 J8VOWI7xZIRMA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 299634C1C1;
	Sun, 22 Nov 2026 19:07:49 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:37:55 +0530
Subject: [PATCH v4 10/11] arm64: dts: qcom: molokai: Describe the Adreno
 829 GPU
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-molokai-soc-v4-10-851e5a9f4878@yahoo.com>
References: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
In-Reply-To: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374466; l=4100;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=aaQjlzszYx0rf6W2Kyay2vYTEiNwBtAx/gmcl/caGac=;
 b=JefTFyAP62Uxo1S2adGm7qfd/NGV8c3yhqohqx7dRZbkilryT3tVFeDv8v/ZIcCzUQoZKDWHU
 R8o+qvjw0OrAJZUcnBJv1HfVDnh8puLnKzweMuXAzjLjbpOilkEz7fv
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The Molokai GPU is an Adreno 829 instead of the Kaanapali Adreno 840. It
has no speed bin fuse and its own set of operating points.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 arch/arm64/boot/dts/qcom/molokai.dtsi | 123 ++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/molokai.dtsi b/arch/arm64/boot/dts/qcom/molokai.dtsi
index 82fd31bda1d9..3b9772edd68f 100644
--- a/arch/arm64/boot/dts/qcom/molokai.dtsi
+++ b/arch/arm64/boot/dts/qcom/molokai.dtsi
@@ -12,6 +12,7 @@
 #include "kaanapali.dtsi"
 
 /delete-node/ &gpi_dma4;
+/delete-node/ &gpu_opp_table;
 /delete-node/ &i2c_master_hub;
 /delete-node/ &qupv3_4;
 /delete-node/ &uart18;
@@ -37,6 +38,128 @@
 /delete-node/ &sdc2_default;
 /delete-node/ &sdc2_sleep;
 
+&gmu {
+	compatible = "qcom,adreno-gmu-829.0", "qcom,adreno-gmu";
+};
+
+&gpu {
+	compatible = "qcom,adreno-44030a00", "qcom,adreno";
+
+	/* No GPU speed bin fuse */
+	/delete-property/ nvmem-cells;
+	/delete-property/ nvmem-cell-names;
+
+	gpu_opp_table: opp-table {
+		compatible = "operating-points-v2-adreno",
+			     "operating-points-v2";
+
+		opp-195000000 {
+			opp-hz = /bits/ 64 <195000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+			opp-peak-kBps = <2136718>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+		};
+
+		opp-301000000 {
+			opp-hz = /bits/ 64 <301000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+			opp-peak-kBps = <5285156>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+		};
+
+		opp-403000000 {
+			opp-hz = /bits/ 64 <403000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+			opp-peak-kBps = <5285156>;
+			qcom,opp-acd-level = <0xc8295ffd>;
+		};
+
+		opp-496000000 {
+			opp-hz = /bits/ 64 <496000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+			opp-peak-kBps = <5285156>;
+			qcom,opp-acd-level = <0xc8295ffd>;
+		};
+
+		opp-589000000 {
+			opp-hz = /bits/ 64 <589000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+			opp-peak-kBps = <6074218>;
+			qcom,opp-acd-level = <0xc02b5ffd>;
+		};
+
+		opp-660000000 {
+			opp-hz = /bits/ 64 <660000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+			opp-peak-kBps = <6074218>;
+			qcom,opp-acd-level = <0x882f5ffd>;
+		};
+
+		opp-714000000 {
+			opp-hz = /bits/ 64 <714000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <6074218>;
+			qcom,opp-acd-level = <0x882f5ffd>;
+		};
+
+		opp-732000000 {
+			opp-hz = /bits/ 64 <732000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+			opp-peak-kBps = <8171875>;
+			qcom,opp-acd-level = <0x882e5ffd>;
+		};
+
+		opp-795000000 {
+			opp-hz = /bits/ 64 <795000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+			opp-peak-kBps = <12449218>;
+			qcom,opp-acd-level = <0x882d5ffd>;
+		};
+
+		opp-891000000 {
+			opp-hz = /bits/ 64 <891000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+			opp-peak-kBps = <12449218>;
+			qcom,opp-acd-level = <0xa82b5ffd>;
+		};
+
+		opp-975000000 {
+			opp-hz = /bits/ 64 <975000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+			opp-peak-kBps = <14398437>;
+			qcom,opp-acd-level = <0x882b5ffd>;
+		};
+
+		opp-1025000000 {
+			opp-hz = /bits/ 64 <1025000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L0>;
+			opp-peak-kBps = <14398437>;
+			qcom,opp-acd-level = <0xa82a5ffd>;
+		};
+
+		opp-1075000000 {
+			opp-hz = /bits/ 64 <1075000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+			opp-peak-kBps = <14398437>;
+			qcom,opp-acd-level = <0x882a5ffd>;
+		};
+
+		opp-1150000000 {
+			opp-hz = /bits/ 64 <1150000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
+			opp-peak-kBps = <18671875>;
+			qcom,opp-acd-level = <0xa8295ffd>;
+		};
+
+		opp-1225000000 {
+			opp-hz = /bits/ 64 <1225000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+			opp-peak-kBps = <18671875>;
+			qcom,opp-acd-level = <0x88295ffd>;
+		};
+	};
+};
+
 &gpucc {
 	compatible = "qcom,molokai-gpucc";
 };

-- 
2.56.1


