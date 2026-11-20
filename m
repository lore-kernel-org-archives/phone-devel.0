Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190009;
	b=35HI/YW/Octn1BFpC4rvebQ+XXSTxg9LQca60vNXixpwl3c64GzxjfPssbvZqz1Nig0d
	 h3DNj2To7bCj5t3s0AX2fBjPqJXZhrNlS3OOD1vB2CX0R/0we6Cdy2vDlg+dvZP3J28CP
	 jnqBPwErmIAn4VLPnIOew+rNOqJm8uw2EWMkovIHySe5o/HhMA8gXWW8ZKOmpSecLqCI6
	 UyJv8d5oAJ0g2JBLAFjlLBIZwpR41YrWNFkH1vN5JkZhlUyh70AKgrbGTr6ZfXZ5NjBkL
	 m39cjj3Rvqqlw1WFIFhIVCquWg54HSOYipRWIJ7o4IsKZHeQdO1lZ4B3L/+xr/rfSTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190009;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dnzfLbez8bec2fmTk67DwQeIcCCDBYG4VAWtUYKJVbg=;
	b=qwvTZCLnA5k5DJKYftVRbsKb0sA1iwX6kBghnK/sheN2ogjIO+0rFsu+yGXYgl5E4gbA
	 p+HtHm6WiqzPC+NV9SYs7i3hpsmPJ5WA3GuFDiAuXjFih50ICGNnOWXBMrpzbX9M/u5+z
	 aBgru++AiiDto5zO90YXcvWGFGJE6zD4Whk5uQeygUoSWBY4YUSnSFuFJeX/FwG4nW9nZ
	 Ys47N0IVo4WpMZvZZxjvGatPBsxAdRbAhnFzKt533IP0UyRPQX2RwFYUqv5hK0kt56qVA
	 ONvWByozI15BFc4kW67KHMpERZdQVpX0LoeG6P+6LjCmUk/b9innrDpH9nxXC3+02iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IhkryRHI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C91160A3812;
	Fri, 20 Nov 2026 15:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IhkryRHI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795190009;
	b=oB6L+sf3oGWT1+EPiTHXmsgNquV/NYOo/Ym1G3HnSVC//y9Aj5IZ2IDBRdLghG3F0Atj
	 1k1MejODw1sFtkW1k8Cxn5Lcl0hu8CTpBhfjSU39xFm7SvASId+Vu/sm7BhqAi6ZawrnL
	 lLFouLtJl8MH6gD+QfYfVgUhGt6rdd71gmGZvf4KmFo7GBbmss+8rblmHIt742mx2ICkZ
	 0kWv+07k0hdq53I7vjR0HfQiSQ1S+6mhDe+4mtMfX3MiydCyVclvhM2gjDucuBGPo2aFP
	 qfzR5N/JdiefnHfv+LTFPYeV7fKnBSlUlyAesjE4UlsJ6WckKfPNdR6mfUwVU7i8biQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190009;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dnzfLbez8bec2fmTk67DwQeIcCCDBYG4VAWtUYKJVbg=;
	b=kfwvoWyatFbp8eatsjAtlA+hSCATvaKQ8sarZUMLsB9lYlsiUXhi5aKimWogs2nspSe+
	 BivqcUkLuvCcOrs7eeIV2PyEXyOXKt+Zkt9F8sts7pkmZ8sQMtfOHW94M9JRExc2+7ZhS
	 H6qAf/8kxl6EQ6FjX8BbE047F44Vbht86sTDHU40yavln6QNW0o0039jum9oDGgoCd/m2
	 ZqlT3WGS9RGwBJY34XFPDcYE68R4H7jbmCMzt7OoZp/SnKJUgd3CvJ4HS3RfxZMxmn1q6
	 ZmSbQ5X1+CpGQGctM9xe8gPyjDyH0sw1199lxqnzfRchcRqbvdYksj8Oo7OSx/rbUVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D25741F00A00;
	Fri, 20 Nov 2026 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190009;
	bh=dnzfLbez8bec2fmTk67DwQeIcCCDBYG4VAWtUYKJVbg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IhkryRHIMr6mvoS+Duc1k6U4ctYWYfqc4fbx358vUlZuxwOtiYXgRDXsXAbrAnX+k
	 GCK2ZcJZG0HoSNVMB6NYC9Kz9yAHLt885j2uoQ/MMon8wV2Z/1wkzF8EUabw8oGVTF
	 nPMz1Edp2TuZYyoQEFH7dShL+Fd+x6VOhkwfx3aYgFAdby/14qZ3+UWSUda7dmwqEt
	 RUUp4dqLa4vSOAgvu9uEfD1m4ye8iT2z9cu/kBnw0NiFMrAMeFJ/UWsydujr7oIX5L
	 8T9r5ZoS/aWxJsyu+MUNDwgp506ETyoF99/d87dCWhNsHJxIZmn31hUTZrq0eQw21x
	 bQGKkHAHdNvdw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9056A4994E;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:23:12 +0530
Subject: [PATCH v3 10/11] arm64: dts: qcom: molokai: Describe the Adreno
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
Message-Id: <20261120-molokai-soc-v3-10-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
In-Reply-To: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=4100;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=aaQjlzszYx0rf6W2Kyay2vYTEiNwBtAx/gmcl/caGac=;
 b=AjQCuxnnLEdIUpoSqSTN0dEFWuNFg16h+uAY/gl4y2chXO82Km++y0ZZ68tm611XUa3QrB2xA
 TQ2epgNfyKSDbX9YK6pdYeAkoKh5toxsnSu9p+gNvVhuHKiyRqaW6AY
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


