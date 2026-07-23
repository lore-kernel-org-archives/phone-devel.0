Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265373403FA;
	Thu, 23 Jul 2026 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818500; cv=none; b=FwmjKDL1vcRkl3R1QHRI1Da6vLDHWWOX0fXTpGDs7kD2IHtvGoREU5em2athrtk0VkC0KxOQYw4Lrz4RN/aa78PDL4BCs7xKrU1o79Z/AigSGJtfiDfUHKVMnc/+TeWW23GCczRDEOg4ZJKITl/TLPgpHMWn/pCHx3feyi6MMTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818500; c=relaxed/simple;
	bh=QEAV4U59CqCRV1e+1Daz1vRxOx3T7ZWxXiaETPt8+e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5wP+uZdyeelkGWXSRtL1F3moTTNrD5sMzYei+4Ol0JOX67cVkJuNglO/UcA/2DuGgJqwvH2olkmZevJZfrab5aUdNVt9V/L7jO4Io1JLHaCShxFBTfaA1uZu6McJy6G6Por4dgjafTd4ygvNss3CGdVde7X01pcblOB4G+mMWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3q3kr/y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3q3kr/y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3126C2BCC6;
	Thu, 23 Jul 2026 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784818499;
	bh=QEAV4U59CqCRV1e+1Daz1vRxOx3T7ZWxXiaETPt8+e0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i3q3kr/yawq5rzDWsFjvtAPd6lqyJQj6C0+nK2s7tm+SWKG9sThthsKPdA9YmG6J5
	 mhpqCEkJ5Pfoz0DzxoZ0q7dmY/aPTA5A1+dUNMf6DIhz4oaSn0wWijoohyqgyqgH/Q
	 0B7eZjjx5Iv4PkBBCpoKSJAbu7v46l0sKeiF/+JBk8qspWV6IWscJhdQCc1fhSflIC
	 HwhbTIn7ZFFW5EzUTP9qdDV/rpvVvXq8tvhWSR//VlB3SCHQRNhE3bQD4KIDlFkAp4
	 vYFrSHJKv234I4uHQcTCnrw14md/3xUT3eqMTRF7/hhaRc1NZb6XEFFACc39/G80BR
	 Et6K5+3pnMgBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2118C531F8;
	Thu, 23 Jul 2026 14:54:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Thu, 23 Jul 2026 10:53:53 -0400
Subject: [PATCH 2/2] regulator: qcom-rpmh: Add support for PM8350B
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-pm8350b-ldo-v1-2-42b5428a0d3f@proton.me>
References: <20260723-pm8350b-ldo-v1-0-42b5428a0d3f@proton.me>
In-Reply-To: <20260723-pm8350b-ldo-v1-0-42b5428a0d3f@proton.me>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784818498; l=1295;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=WpvVHbr3AbWbUS/FGPBN8RtA2Y0Nr6DvrP+keHwhmM0=;
 b=ajbmyhj5jTzUeAPR+4eB5vPOg9F0Hk8ryp98ysevM7AolBSOvkKyxscMCBksotyWgCsF5fTd7
 eV2f7+Dp7ydAYWzcclbkX8U/PKxqSKnAyHGnCSyE3TZaJcvHOxAB+SH
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

The PM8350B has only one LDO, which gets its power from a dedicated input.
Add support for it.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/regulator/qcom-rpmh-regulator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 756a4201225e..73856e3df337 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1269,6 +1269,11 @@ static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pm8350b_vreg_data[] = {
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1"),
+	{}
+};
+
 static const struct rpmh_vreg_init_data pm8350c_vreg_data[] = {
 	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_hfsmps515, "vdd-s1"),
 	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps510, "vdd-s2"),
@@ -1868,6 +1873,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm8350-rpmh-regulators",
 		.data = pm8350_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm8350b-rpmh-regulators",
+		.data = pm8350b_vreg_data,
+	},
 	{
 		.compatible = "qcom,pm8350c-rpmh-regulators",
 		.data = pm8350c_vreg_data,

-- 
2.55.0


