Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804787;
	b=x8CKRit1ZoXXTK6rxtad7NTieQ0/Fj9ckLaY9Cl4ZLvtoD48raAv3g1UuRN960F/h27v
	 r1/Gltx8k4bFy0sAqxV/mTFHnjDs2UtfvORSGZr8I1U36EGDK0q5KUxmMr5NhiegTC1rs
	 mvCna7H4F0Qm4KeKCH4YnMlu0vo93lHMfMEesSBKVsA/MtO6fizJEwHAmMgb0LDGGWmYf
	 +W8XWNAPufGj3ZG76gaqoALNfvh1ZXHqi4WF8YyDxKyXxClSHFp/lzalE8BwfGelTAoEH
	 OWw3b5pIVqtqUtY7iVIFto1y3KLzIwAjlIlQ4DvK0mScfogpzl/eYQmENKC7hF8jLrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804787;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yk4dsQH9Bm4XJAyH0eb6JYh4zs5PpS5TysY+u/6+ZX4=;
	b=GvnO+yD/aad01nBjOV6UmNoRdaleyJVOqNR0QyDAT3MUNUGZfJCNMb4Pkt4jRXZglZUw
	 gVnbSa9GIo9F6XqaE4XrTH3Ph0LrhUkEPFw8tYlKkdq5GOQRDTzLonazXFGj37fxzBNs0
	 6il5WwcvKnQ1XD/7qcqU1YgRXhkkbT/LWPXzS9tfdIuuKxjIMAcGrhgeYqtuYE9Oxbfkh
	 buoq7FPzi3jWSLkPWL5aNf3PLdhZxyDBfuGA57SqimwolcOMUkG911e1hrm2ffdGm12+I
	 dp63xf1BgaZe2rxfnOXefovcbVoJ3bc6ybkQvKsv12KqRfeyzyhJhQVG/qEqXJGM3hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCKkICnF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88E460A261B;
	Fri, 27 Nov 2026 18:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCKkICnF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795804787;
	b=BAu8bEmP5uD6tIH6T+XvCTgle+IBj2ipTdp1kFFMRP61fiD/xg8Oq+KxpD4TAts0sDFR
	 OqO/82yZzGV2As5IO1Isauj+zNEEwEBXUyRWDm+Rm+dW8YOkc6YHRm88bgmrofakFw7SQ
	 3AGhLzHQNyuyAjRUK0bwSt6txL5umGpSs5IO3WWTPYBfczMMupBtWXioWWMykvoDYqbH3
	 +pcnbY+SwKSyvJOawVg7JX++FnXmCHKQCg2HWJMfiKMYHGPEgwT9xATx9eE+dpYonaa8G
	 oyfAhSmr/x2mYsnT+f1o28TxR4haR1xphY0YAY6OAd6d+Z5JOpW0PpX/gRowa1pIeJw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795804787;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yk4dsQH9Bm4XJAyH0eb6JYh4zs5PpS5TysY+u/6+ZX4=;
	b=m2r1G1iTm+aQ8oGzTR5gFCByTohobDVPa+YXM1XPOXU6dS1sqqQe75wb8Hj281AFYvM9
	 XiT9R3Qp1EcD3CijE7UYV0wkr80HkoKjaVygI/0m2yo6b70aqrXGviplvd+OM0nEb9w3Q
	 AdjlrwTwsD5oGDeRI2Sby4Y00pddD/kRvSYxGJmF1Q0SIfNhbmq9N7U/krX4/UsTBByAd
	 y0RSwbLY8OPkhl8E3N58nitkRIuOxkVnB/FpeJmXR1K9YTUuigBw1yfg6turJ436gI7iR
	 5lqcylzIgBcrDTnjg1Ai6ZtFGhtjLzsgw3WObrhQCQ1Gm7jrc3c/lCE4YuWeFfo3AhA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 390861F0089F;
	Fri, 27 Nov 2026 18:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804787;
	bh=yk4dsQH9Bm4XJAyH0eb6JYh4zs5PpS5TysY+u/6+ZX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eCKkICnF9bgjELMcs7urqwfKV5D9N2Ux0A2fgvcuf2JnKHNi4PAz7gH65wd2ai/ar
	 mtDZvnJ2yrdBdbqThMTiVT4wmykzBIZBxzFFHE50kIxv95XzyFLoZy6JVe5P3TAHFO
	 5ugaOcQ/kPuxZrLbBqgzwIvcadZvq9Bva0kLpoxHck22FqQFgYhjByoi8XR/lXtVxI
	 Uoc+0RoVKMiDeQOYFKq7QCY/9RdJwRc2biNJMMrX6/Og9iDAg1zLF6ARNJiUp7CfsB
	 0ShXt6DJ7tAfv/aT1uDF+nSlyVRvPppLWVHCMEtWpUnmulMrVHdMiN722JOaBzK8hN
	 ENy9NbUQJ+UxQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B78214DD4F;
	Fri, 27 Nov 2026 18:39:25 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Sat, 28 Nov 2026 00:09:30 +0530
Subject: [PATCH v5 10/11] arm64: dts: qcom: molokai: Describe the Adreno
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
Message-Id: <20261128-molokai-soc-v5-10-144801dfad7f@yahoo.com>
References: <20261128-molokai-soc-v5-0-144801dfad7f@yahoo.com>
In-Reply-To: <20261128-molokai-soc-v5-0-144801dfad7f@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795804762; l=4126;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=LZnA/MDcj4ypRmoIhgtWzVt6z6Jhxk0tT3EEk84rj3M=;
 b=WJBAbEts1+QbJiaVUYXCHxXNg+VwnY7JA0xYe0EeNA0kbRDqw3a1Bk3hGGQLoCDyE/ypYNHX+
 rlJBh8rB2UrB/TK5LDvEbOoWslN//jZz9GyzDEFbMtTQUQ/xBOUsGvX
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
index 42446354fffb..03c7440eb384 100644
--- a/arch/arm64/boot/dts/qcom/molokai.dtsi
+++ b/arch/arm64/boot/dts/qcom/molokai.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/interconnect/qcom,molokai-rpmh.h>
 
 /delete-node/ &gpi_dma4;
+/delete-node/ &gpu_opp_table;
 /delete-node/ &i2c_master_hub;
 /delete-node/ &qupv3_4;
 /delete-node/ &uart18;
@@ -69,6 +70,128 @@ &gem_noc {
 	compatible = "qcom,molokai-gem-noc";
 };
 
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


