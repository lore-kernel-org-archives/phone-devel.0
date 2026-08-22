Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7282773E4;
	Sat, 22 Aug 2026 05:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787375744; cv=none; b=bz9Zv0HXcTGVvEOkgzRlgnxVdmDLiSr/VsqHgaUlsf/79szpwjeQXEs97oGAQBIS8uEeKUmBxiLuYxfYD600wr94An25fkwv32+NijlipZCFzMWpoO3U5ehtSXOKr6o22FCpPy2JFLlFheV4MOhZ2x+D4MxMPqRWCD/yJMwX0jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787375744; c=relaxed/simple;
	bh=rDZ0z+Fi36+PCBmpbr4JERAVEoPyMBkS3zxYFagrmp0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sx9qc53ViyfSQMlFE1Yf4Hf+GABP3wshbnJ9GlRvzH0D85NQraiX/5kjALo8mN9M+S9ctHiR5OP8iS/b6fUbycQzowoFdPmHrSY07KXzC1mTYSqH+dYzWbenb3rovhFefArYnx2Rd47udLQet/H5k5oFmSIvpXg5uaamT1ZZ44E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5NRwSx/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5NRwSx/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9370AC2BCB8;
	Sat, 22 Aug 2026 05:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787375743;
	bh=rDZ0z+Fi36+PCBmpbr4JERAVEoPyMBkS3zxYFagrmp0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=I5NRwSx/meMN8cdz97clsbIMVw5+ND8DHRqdHpTiIC9unvDKK0l+M+ZBp9p0pDdK8
	 6Cez31xfxPd3cizXMAMp/UVOIyXvSTd+cxOmlPPENuF11PiL/CwGCRl7lw21QKQpq0
	 jEives+TGTtB3r2NZQ82vIQbQyoLERxKR6DprnpGJZ9ybRPFINwp0eQCdJMmc69/mt
	 XTeeLX5UZ60AX07+gR1HABsdOqSNfQlxajq6uq3w1bEi72eSypGWNVI67/7N9vpG/g
	 lS11Yrg3QTWN9SMPnc06zum3l8i/RtfRO8LpPzYIecMxsZIeYgtJRyxuCInWGlv+1u
	 61Xknt0613sng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68472C5B572;
	Sat, 22 Aug 2026 05:15:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v5 0/3] Enable DW9714V camera focus coils on SHIFT 6MQ
Date: Sat, 22 Aug 2026 07:15:15 +0200
Message-Id: <20260822-dw9714v-v5-0-502bc7f43b8f@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XNTQ7CIBCG4asY1mKGgUJx5T2Mi8KMykZN2+Bfe
 ndpTWxdfhOel7fouE3cie3qLVrOqUvXSxnVeiXiubmcWCYqWyCgBaOspLt3ymRpKmuNrTiwI1F
 e31o+psdU2h/KPqeuv7bPKZzVeP02HPpfIysJUkfjfNDxWEfYpUfqN/ElxkLGhdIwKyyKKmqUZ
 xsthH+lZ1WDnpUuqmYF6GqKBPSvzEKpxV+mqAbRxaAIfVioYRg+Sj1DRj4BAAA=
X-Change-ID: 20260416-dw9714v-4566465ebe7d
To: Alexander Martinz <amartinz@shiftphones.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3375; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=rDZ0z+Fi36+PCBmpbr4JERAVEoPyMBkS3zxYFagrmp0=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGqJMH2gQ7EKfkcSwxDewI99sKXwOeSqLvVXISYoB6nFtwUIy
 okCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJqiTB9AAoJEGACP8TTSSBy4WAQAMZY
 hFa25m3Qy40VX6BdSKEChcz3zeASRmVKmr446vCyGheQAqsm2jgPpNhhyawSIXE3LYelC7s6gt5
 Y/Esg2ACFXLcabzcds92fBr7AK8+wqx5NeNLFBf8mI2Gp+mht9grCpPzOHB35KmeXdRoeEdBQMF
 iPGGbqvNqxN09iOiGEE2DO9+F6aOSgMIB/yWsU7trZULAaoEz0xcZK7uqdgzp18dnaJy/DLsjPo
 4uFta2r0RK4SzbmXr5RhVxPDoBETECpP9hGk/A+C6opYxRCI8IiWw2QP8pOUse6a33LXjBn7znI
 vrC63dRlCyiQX/0fKOl48kFrzXcupz6KTStI9R6M0w1gPeiUoWR6EI/eITt+nf0n/x48IUbVPqG
 8HtjkHjTMh6NzEHCda7EY6W7GpA7aRSON+/zIDvGEBfavYdZoXxLEjLHEPeRVNbiMEiCOoiqzkd
 oG2F2qrHdIJd5JUBiruH9VNzLIrOOc3FLbFqO/XD3NUYka8/j8juffqrfpRtabNmIPAPx34Ko3C
 /VrYylRl7qA/6Rr1vg6kvtIrwoLVAgLpLoJYmyADpISXGV1pGbPgK9wg1j/76LSRiy+28kVBmIa
 r8h9oX+bGIwMbpnbT3ZyYG4h4rYgSLGOwKEOArRR++Xx/6drC54J9yzTfjmfYH43k5w+uzBElEv
 1C8NC
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Implements wiring for:
 - SGM2036 linear regulator used to turn on the focus coils [1]
 - Dongwoon 9714V focus coil used by IMX519 camera sensor [2]
 - Dongwoon 9714V focus coil used by S5K2X7SP camera sensor

[1] https://www.sg-micro.com/rect/assets/efa85993-263c-41aa-9274-b488f59f85d5/SGM2036.pdf
[2] https://datasheet4u.com/pdf/1247146/DW9714V.pdf

Open question for future work: modeling the I2C bus supply.

Like many similar chips, the DW9714 has a single VDD supply, but its I2C
lines go through a level shifter to a 1.8V rail, and there is currently no
place in DT to describe that rail so it gets enabled during I2C access to
the device. As a stopgap, this series models it as an always-on, see the
comment in the vreg_lvs1a_1p8 node).

Direction agreed with Rob Herring and Mark Brown on IRC:

 - Modeling the level shifter itself is overkill as long as it is just a
   supply; modeling the connector would come first if needed.
 - Since each side of the shifter has its own supply, the proper solution
   is a generic 'bus-supply' property valid in both the I2C controller and
   device nodes.
 - Defining it per-device-schema would ideally use an I2C equivalent of
   spi-peripheral-props.yaml, which does not exist yet. The pragmatic
   interim is to define bus-supply in i2c-controller.yaml for both places
   and add 'bus-supply: true' to schemas that need it now (dw9714),
   deferring the peripheral-props question until more shared device
   properties accumulate.

Once bus-supply exists, the regulator-always-on workaround in this DTS can
be dropped.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v5:
- There is secondary rear camera with the same AF. Tested with the
  camera (not upstreamed yet).
- Verified the both rear cameras i2c addresses, added comment about it.
- Link to v4: https://patch.msgid.link/20260810-dw9714v-v4-0-a227cb1d29bd@ixit.cz

Changes in v4:
- Updated DT bindings commit description. (Sakari)
- Link to v3: https://patch.msgid.link/20260803-dw9714v-v3-0-8e10278dcd0d@ixit.cz

Changes in v3:
- Multiline compatible. (Konrad)
- Dropped output-low from avdd_cam pinctrl. (Konrad)
- Then dropped whole sleep pinctrl state, as it's same as default.
- Reworded the TODO. (Konrad)
- Dropped camss node. (claude)
- Moved before cdsp_pas (sort)
- Dropped unused regulator label.
- Switched the i2c bus shifter with the regulator VDD, as previously it
  was incorrectly wired and keep always-on on the i2c bus shifter.
- Link to v2: https://patch.msgid.link/20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz

Changes in v2:
- Address Sashiko findings.
- Link to v1: https://patch.msgid.link/20260729-dw9714v-v1-0-3c479b3cf8c0@ixit.cz

---
David Heidelberg (3):
      dt-bindings: media: i2c: dongwoon,dw9714: Document DW9714A and V variant
      arm64: dts: qcom: sdm845-shift-axolotl: Add actuator for main rear camera
      arm64: dts: qcom: sdm845-shift-axolotl: Add actuator for second rear camera

 .../bindings/media/i2c/dongwoon,dw9714.yaml        | 14 +++-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  | 89 ++++++++++++++++++++++
 2 files changed, 100 insertions(+), 3 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260416-dw9714v-4566465ebe7d

Best regards,
--  
David Heidelberg <david@ixit.cz>


