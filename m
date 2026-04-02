Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F289F3C65E8;
	Thu,  2 Apr 2026 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123650; cv=none; b=EZNDNyOg4o4lbclbYo2UcNH01pIFLOBPg56/ZtC0HJRegNqcoC1mOVsdkdLXkAwn2OMggGePDI8UYJdtGwTxfZSHbj7BwFHLTv9RFBthQ1Y4ydNouoG8RTo8y2/3onXrrei6uSVz9NTH9h/ZFr93XTBNe+SqxD10mtgKq46NSzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123650; c=relaxed/simple;
	bh=/vXwbUx/wEI5emVC0Vt6ADYW+CUqAJYC1yC9sW31Rl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ky/SuG3IztUjZHGSW29eIDmTr7KezEC3aIr4plFndVMqwK07RISxOnr+5/YA88auV3gA94SQP6wbBiKWdssCwcor4CK3E4s9e2K5HUSRsZz3yk/8nOco4tIKTqYIhKhBMPmy9urViCC6bjJMCAQZR6pLM94duq503BivBRJIuZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2oDBz3j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2oDBz3j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A09CC2BCB2;
	Thu,  2 Apr 2026 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775123649;
	bh=/vXwbUx/wEI5emVC0Vt6ADYW+CUqAJYC1yC9sW31Rl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X2oDBz3jzvUgU2Hoq+th/MyBPdPIE41kdkxWZaBJs/e+w2o2xw863dLO9xr4kBTEt
	 kSChwjOebw1hMT1QrImpQ63K2Gv+5jps5b5u7yW5XK2gioT0hm7AXYjxOq4IaL4d3D
	 pfXpHXW/Ut6FEku1cOm6XQR+4BVSDPcmyUZgDCeWdBqPlwGPP9GgfQUHDXx1Vmyhdm
	 42yHuSGN5C6Bsjyo06UQFxdVUIC2dfOk+t8EOjBne0s5FrOG824nsAVomNXWsihYYC
	 Of+k5iZ03aDZ6x3zPgcLOFLlqLuxOtyFzsOXA3TNDyij3jONZGOO3W9tP46nxfEh42
	 h1sM6OrxrXxfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B70D3940A;
	Thu,  2 Apr 2026 09:54:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 02 Apr 2026 11:54:07 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-axolotl-misc-p1-v3-2-8934e9db6831@ixit.cz>
References: <20260402-axolotl-misc-p1-v3-0-8934e9db6831@ixit.cz>
In-Reply-To: <20260402-axolotl-misc-p1-v3-0-8934e9db6831@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Alexander Martinz <amartinz@shiftphones.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=9p+K/F4jbKx5IwsqTA3jbf55J7M/QFSo8brdWdbijrI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzjy/9xJHnhjNT6Qk2yPhnOGmFdNSYXM8WMu+4
 AjEBa0p2eqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac48vwAKCRBgAj/E00kg
 csNFD/9YMHUrBa9PsOyayLViCNbx138tHBJuuRTyMd6t/fwcAphniB0+7EWjeqiGNgz35AaLREZ
 VmU1rHJstEP8yz/bb0G0AIC4TlAW1FQH6XhPbn2m0Pj2gafflIsJYKoo4nqjteTgK9IYdQQpLTK
 BA1VJY0ginDt8VcXABSryfjlTYbrzYaTjrwDbxofBriKvGppo4mUk1MFb3YNkLLUmO8mROAC0GH
 ZlPW7wfBY6KhAynqcjkXWP8nWiAHFUC3jbYRK4qT31J8nLdSaeZpgo4Q2hiHCASwn1Cit4X3q6N
 m/xkHbCj5m4tf+a2xnWnF1YPghd26BnHvv7KQjCiumkyVcUemYirRd74To4ocnXTJipRwZ5nO+I
 JkCKkpqy2Q2FzPWTGllyG2elsXPfZMh18BUo+RRxQqO0qXpQe8hvErYaQZpCRhAlPFGxFxqbOai
 l4YMrhs2EYZjzETNW8e711a7j0yi1V4lrUr23fOcnTxpv99DRnUrT04UgS7nV+B3W+24wI2NF9a
 6uzEOoLLPVc0fzcOBRCij8jWk4Szy2j096Lcyvsu6T1jPhqsbGmtu506YbhzLTUeSJ14XFBHTBL
 6f5TBkvZGs0Pkcqe0m5VmW8iX1JkWzyqD/6V1SyRHe0Csti5AUatIp7crFUv8ukxp7o0ggsuwmO
 qHcTh23gzCAWGXA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

Sets a higher rate than the default for good responsiveness of
touchscreen.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index b05f04a621e5b..f26079398e07b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -432,6 +432,8 @@ &gpu_zap_shader {
 };
 
 &i2c5 {
+	clock-frequency = <400000>;
+
 	status = "okay";
 
 	touchscreen@38 {

-- 
2.53.0


