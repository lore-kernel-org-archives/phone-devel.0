Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630390;
	b=5FwCENx4WOyXDMIwJaziilc239peeCPBfPUzUBOK6Lv77gIlWeQk+iFYgHwKNhr2ASIj
	 UgZaQo1dy6/tyfLzFdEGJAPcJqA4XF7LZSF8+LlHpxSfy7Fbo6SQytOTJRNP5hh8IvgiE
	 87rQTpc+fFliaO4/ZAE8rRrS7Ek0P0dUJLyst3tLneuH4VPt36/JOdIAI44LxMak8Mgwu
	 WZS0Rx6xJ2Tm8sbyTuTOUuM8qNmcwk4v1e0SCpV1ygUrrqYOq+z6rXi6DJw23t8yRy0N1
	 XySLTJYhsa6Hr/v+eFPwS/dW+zKgHlpjBBHMfCuyveUbP4NkkQ+212vPqT920HrUHPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630390;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vzJcLx+SQa2Mzs4ezZQYK9idTcUYGwX4LPcGJ4IS7QA=;
	b=cDIfgPx3qP9hWcsgVCxvYLoMganIDFL1vX914LfcGymqCYdkwjUZezaVHSoJUS7kJkN8
	 YPv+iRBQiSbpIbLOGwxuYOsv4xQlsLVNgklrMWj5dDVcEm4EZ/TsNFMq+xehBzAIFKO4N
	 kwQe2eU3ahrwuBPYuRo0I/KmiKMDwDPLYvmCgi9eIhVbYnqtDHU5v29Yp0ImkDPpVxghK
	 /7O+mvRb0IJhQJ888/Rs+qY7golFo3yaf5estzCKGCBFsQLOT7+eJkQhajFaSGWKSyv4Y
	 3HmbmctElj5AVXMzBg73S+3+giMM1qAKBA/jL+61sTYKQfoegsbSOhFfurQR8+lz+Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAM2Ww7M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C2A60A261D;
	Wed, 25 Nov 2026 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAM2Ww7M
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795630390;
	b=zerYsVqCouGVpjBJM8+UqxDWR5aY201Wou+VrtByQRosOIkkugE+4CL+Aa3k9BImsgwH
	 GKmB4VOB2Xr+SHa8im+ObFzUyQRlPbsXjWP4tQweoNws5g1qdgLcHQvVWhZZR6b64lkeg
	 zgnigw8cL1EhEKrVFqvJHz6MfWrXG/PC54cvtyO769oO++l6ANaMfYof8XDM5tDqUlLeK
	 lkPpGYVb7hT5r1UT8p1W25YHKLG91JAvRthap66NK8g7mczk88Z0yJX6VIFfRzCZiwBrh
	 f5SPoj19u8TfERovjzjhkt94C2LKS9t4eyVcAvRFuJ6w6laHZKfU8bvnlB5l0nJeFpA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795630390;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vzJcLx+SQa2Mzs4ezZQYK9idTcUYGwX4LPcGJ4IS7QA=;
	b=ssi+6EPEmyvOXkgOoNZhP2PQvoqwRLcufMnOnf25L1I3RGScb9Ipq4jjaJY13zMtpzaa
	 29yJix50MPxqY1dHYHY68S/Oqf4uAHvZXpuayxwNj1vZsAoiJ6VVupRlvacyRnoE728m/
	 7LuWEFooKF247GwIiphNTfHaDMqx89P3I5jYygRE3EFdn80aWp9hQhW8TBUWhxbF8RDkO
	 WUtI5jzVF7faKs6rdyD8NF3rfx5fQRYN0BEzH8Xy6+33FiFl3GZPwb3bKmk/mxx2O4NVB
	 MfBl+93/m09rGcsYPRtCtuEUaHfrgQZZbKXWVj8OvOU4kfFpjFbJgQfL0ofZOZkcuDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65A081F01568;
	Wed, 25 Nov 2026 18:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630390;
	bh=vzJcLx+SQa2Mzs4ezZQYK9idTcUYGwX4LPcGJ4IS7QA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BAM2Ww7MFL32BaSme+2RwWvZVUnYP0F8MKCcKHDtoU/9/MGj3aneCrg7zrECffbVh
	 SpRSe/QWboEi27azmH1CcRq7yHboGCkgttInO4tghRZO1O47bnWul22a28Vveyfr2q
	 vMn+L4Kxl1MT1+/HIxP7iJZGaJl07XYrrxpUiODLP/+Mf9G/AX3Fiq6M5hItQI6ffB
	 YKYG6SWBaYF66lAoHScKEfwlYoLQeyp7TSLzRm8jUicJ5W9sSVVbE2KuDK6DtjTuX2
	 6165uwSipZ5ByxsgznWfIiIu9kK5NRCxsbxXHqGbRTgqla7rCgo6Y3CWjvR6+Z3tSl
	 HVI2J3T/VPj5A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5A3304CFBC;
	Wed, 25 Nov 2026 18:12:49 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 25 Nov 2026 19:12:52 +0100
Subject: [PATCH v4 8/9] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Update panel compatible
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
Message-Id: <20261125-crosshatch-panel-v4-8-120adc58e737@ixit.cz>
References: <20261125-crosshatch-panel-v4-0-120adc58e737@ixit.cz>
In-Reply-To: <20261125-crosshatch-panel-v4-0-120adc58e737@ixit.cz>
To: Dzmitry Sankouski <dsankouski@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=mkxVrIpbAVEtMAGbgohHi1tEOw9U/nu44YtOaqkhOKA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrByUeUCj8JXk8HfdS7gJ6Hh+5fJFHcs4+F6ByI
 M5RKPhtxK2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawclHgAKCRBgAj/E00kg
 cuMoD/wJI6NkkyxeycrWfjgnO5bqmxt6xGPflHA7v7lshuX7fs6IrhhneCXg7SuTXEQDwmDO7io
 XUo1d/et6E0pLtMuO0C9ZGZfQ/ljDjP984HZxsBaGNNXsYILsBWO9xcLuJqqSha20nU9FExbIBB
 48BFW526HfyPtetgXyqwqV3MoYKIjAT+cwSajMln0ycxN81uOJb0Gg+8RJEvZK9CBPxA6n6FXba
 7KSJHFx6MGuWIBAz6Db2EMTM6bOim6qnWAZcDgBJC4WHX1Ol1ImTEeeRlHia7U/WE7iwVsBA0Xl
 lXoqALZwNoSktFA43G/qWrWT4qZfCuXVnob38cjC2+rQjc1g0abHl8JZcnko9iACr89eUiCa5Lg
 LlDDjvIDIrFTgD8bUW7VTBIGUhAn1jiMd7v3bYllfPqp78XzveCCZwpXslptAlREhiN7J5+F2BP
 tDED2AV2mRrbt0pHrWktZAr7IX7NDDXA6eAJSioOwDXERkxFcuwMpt7wa1K6HlbbqzLQTqKJhIK
 p73GOVjncaqYxedTnYR4vg3vAjM4gitZURLMs11+bkOg8fMU5oi4WZgu/9pK3lOBKE3Ad2h95Iw
 Tj7vAHwMoP69rbdeBeBoiQNMgV+pyErRZAOG1pAxlZRhDRwWL1IWOIfZMDtFLXAcTyKyMDYWRIQ
 J1ePZ5Q0zzaQHYg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Original compatible describing only the DDIC used, but omit describing
the panel used (Samsung AMB577PX01), which we have no way to detect.

New compatible allows without breaking ABI fixing the inverted reset.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index bd59f1dcd96dc..c156ed3733b4e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -262,23 +262,23 @@ &mdss {
 	status = "okay";
 };
 
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l26a_1p2>;
 	status = "okay";
 
 	panel@0 {
-		compatible = "samsung,s6e3ha8";
+		compatible = "samsung,s6e3ha8-amb577px01";
 		reg = <0>;
 		vci-supply = <&s2dos05_ldo4>;
 		vddr-supply = <&s2dos05_buck>;
 		vdd3-supply = <&s2dos05_ldo1>;
 		te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 		pinctrl-0 = <&dsi_default &dsi_te>;
 		pinctrl-1 = <&dsi_suspend &dsi_te>;
 		pinctrl-names = "default", "suspend";
 
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&mdss_dsi0_out>;
 			};

-- 
2.55.0


