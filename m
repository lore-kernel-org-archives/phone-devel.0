Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58D13CB2CC;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024147; cv=none; b=jPB5hnBY4iTsKee6L2E6EfXld9xrGgEIwtXWrdJssTI44KtvQRvoHEmMC/CQ+NHkski7EZ0aSXFpSgli0gl7ccM48gnrY85jKRUJ/BZBm6+HBgjeeqj2gp0tpQBx/3iEP4QuYCiBCyZe9xRjlPZIxWe5sPIGf3TbqpOkUfMc7K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024147; c=relaxed/simple;
	bh=Tl0cBmQFO6SzEUpIlcnPS82ad0RFGxin1DOyrGX5yXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DN8whqmz13hU0H7Wbs8Kqnhkgk1VfrSUNzE8I4Kon3YhwdUo7yprBg1mqaOFFXN9SjXNIY29a88CixnL/Bbs4osZly9FD+t3BTJaP87kBzofbzaytsjO6HMomc0VVaeCE4GdStD8qGg7vvE5DUVfNgbTCuDlKC3NyqZHEqgzb2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeDvdT91; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FeDvdT91"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8800CC2BCB2;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024147;
	bh=Tl0cBmQFO6SzEUpIlcnPS82ad0RFGxin1DOyrGX5yXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FeDvdT91vIwsLVq4lcN92cxGQyWsEd/Gv4+Evz03U/snfyQe598kthY06MU4CvyqH
	 AIqLV95x3Ofeh9HSTzmMHAy8ezwKrb5g2ZfEW/ysoSkxB3iAW9ZlEP7vaNclxbuflX
	 VcF18Ejo+rcoodi26CuKafcn8B6h12yklH+pyjXfDVZbbrOSlhoJdOMx0UI6nhZA/o
	 U8nLaHhT6m7fct+WRN8xqQVQW2XBDdCjFJ0AP77Kyg91sBakcq/CRyATd1oLbheYnl
	 y/fjF2OETFahpnGmFMwmTxjbg4fGcdwdHyR/6RyMC3mU1BkU7LA4ABpIvXio1e3Yfa
	 Y1RhAZZZ8txfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D47710987A9;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 20 Mar 2026 17:29:06 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
In-Reply-To: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=710; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=NWMLGsbNtB42CC2D75yqh2SFHZ5p3oShA6K4n6umXsA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpvXXRS/+Km3l7C1DG/t7dCgJjAdgot+rf29dhN
 jt4ERVzIPSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCab110QAKCRBgAj/E00kg
 cslvD/4rmQAp2oOFc4SkQ7dqC96MF9OisFgjRJGBUddN9wyRTpdQrrJn1+/EvbSdVfywTgKy9Zi
 X05D9nVGTw/mshz5G1wAgACKTyR9M5m0tQTpNcG7UEejecxkiH8DH20bAUh/CZSX9k9RWu4ZZCI
 vklamp6rcg7ENAkkbLvca8nXhjxVnvQy6caG7l5E4mDx8HI0P3q8RiaWFuopfF6Ayg47ytSZkAD
 99q/kzpo6ToQiazkX6ZnwyEB6g+VJh8sUt/9Y2zUrG9KhzvrXttpf4FgE48ug70peyTPTqweQZj
 okjm1pIHT51e/7mekJpyegKO9FS11mb/gqvpkR1aFZbOK7lIiP8CzNJsAjmXO4a2i/NFkc8rO1R
 Uq6/P9/zn5bwCWoKFUD4AuyhpiybvN0aOgTw4CZgOnHX/vWTi8BtGAc4mWCSUkuDjlKbWK+IWA+
 a4ondhVOoGvob4kZQmxdZ4mcOhs3PeNGZeYeBggCKIx45suHEHR0eQBN/xCWmL/pBHCqX8I6xG8
 YE55pl45rnXi7N1uWTeti5hNJ4H1phEnex67cLmTbbCvOysIp5p+ruJaB2LOkSKINw4hJ50158T
 ASoycnYL/18J9PyPfSTdwe02quBdVgAOImIQGB9bHDEMFEdLAzisJoSXV335rdmJkdBR7Krex6J
 6fBpxYjyTRPWJfg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

Sets a higher rate than the default for good responsiveness of
touchscreen.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 1f21da310b762..8d4bf858b238b 100644
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


