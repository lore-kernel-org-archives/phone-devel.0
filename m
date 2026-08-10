Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E6379CD;
	Mon, 10 Aug 2026 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357348; cv=none; b=Ugma28KrV7+9FWEK05ZBWN7seUDCN573IbahSC3ADQQCD2jSZ0uH9v9j7rWW76DSim3r5ul2q6w8VVs+dgGbMd2YVuCgzusrS1RsVfMSzlnKypwxQoLpEVkoVYCaTArrFrjzPczrOXNREKAQoKGtTDwcz90A4TWzew5/8fiUdCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357348; c=relaxed/simple;
	bh=DgcQbeChtGW8icM1Xx04FXlp9L3vAMf4t3oeZdi2CFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U2hU4xQlCviqbS6SVWuWe5DoZpo2GfWzOTdzQHg7jOpWYHsHrAhDiUYgenVVDr1NcnNpLaJIh6bwZGfafMf+cSD3K0QeUadyFsWJSBRrpTqAVWFVsfkOtO/EwKEHDsmYFOg8KS7duaXuIoVsp1r12j9bAOxz+PoEjQQcxejSvQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oU4Hzsg1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oU4Hzsg1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62640C2BCF7;
	Mon, 10 Aug 2026 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786357348;
	bh=DgcQbeChtGW8icM1Xx04FXlp9L3vAMf4t3oeZdi2CFs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oU4Hzsg13dM2FMlItBlNO+ftXrzOC+xXJILx6xKcYh0aOyl0gtGu7LWW/Bs8NOpY5
	 9ri6rT1hwlox7zDNDgsvOUtV/7ULZrzBs74sdYT7lcj8p1j4VbHyKPHf9DFLe92GLC
	 63WeUEjuuTnHc23AGBSC2paZQP71PDpQlb3YfT8DtZnF0UWgMdJVjG3PapUAoMkWde
	 nmetDRJ1uZNDGnx316QlzJTjdRFBi31dCNyX5FW8vXihesPJtPFORX2mQCtRXdEwOc
	 si+w8L9xeknDfXvOkxWqH7h6vFP2/Ni0pfOjMCiNpvSScbhhmtBrPfmdd0Jzcywg7w
	 4hyki+LZBbYEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C78FC5AD7B;
	Mon, 10 Aug 2026 10:22:28 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v4 0/2] Enable DW9714V camera focus coil on SHIFT 6MQ
Date: Mon, 10 Aug 2026 12:22:22 +0200
Message-Id: <20260810-dw9714v-v4-0-a227cb1d29bd@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMyw6CMBCF4VchXVszvdCLK9/DuIB2kG7AFFJRw
 rtbMBFdnsl8/0wGjAEHcipmEjGFIfRdHvJQENdW3Q1p8HkTDlyBZIr6h9VMJipLpaQqsUbtSf6
 +R2zCtJUu17zbMIx9fG7hxNbrp6G5/TYSo0CFk9rWwjXGwTlMYTy6F1kLif8oAbviWfnSV8yic
 grqfyV2ZUDsSmRlkAHXxjsPflfLsrwBDFvWvggBAAA=
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2958; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DgcQbeChtGW8icM1Xx04FXlp9L3vAMf4t3oeZdi2CFs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqeaZiy43kjvu/WwtCZvoAsI8zsQR6rQYJUywOF
 0ujgJOoCHCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCanmmYgAKCRBgAj/E00kg
 chEcEACwp2dBao5cybUyeVvZjdhXzMXAtb4rc6cJbvIgnXQkC5cd0zT2oO3kNwubWM1VzrGd5rC
 gOtyuXtlg6YAkwnnGNSybPcA4xQe3oyQQEuADzuL+lsKUJFFwE18i/KlSn3hz4+5fdz3EvUTy4r
 i/FghdlW6E5ZGCl//xTRaqwzEGsTrQwT3WAf7d0QhraLDSOqe4zOidjQ34w/d/BD4kXDXN2x+C+
 Zjfn2Sk1QX9FWCCQNN4f5KwRKXD+cfWjJHQqBw+kWXSp8cOEQ3A+MIDAECr1p1p13QaTIvv/t1v
 PZxYYdA40hlujZUf9a3i59qvFehrgC5mJd7ym4YK8Az/Av42v+wP1afi/XnfWfeXQtLWlBVdcta
 9COJ17k0Mc394fSEkjm3XSTodPl0Ob+vrS1vdEKozNuPUd5r43G5V3N2AkhGU4ZZBC0u/erlTJA
 dkTh4luUIbzmU892lWQ0TWVwEnODg5pGrpsaFOIeo/ZwLAWse3W9Jx2c1boPPg72lQAfC7qcwql
 lpOiSqWi06YnlGaP4RB821dS+iiYg/RBaCiNltI7GI8lcaEjqpZt+E/ZSA71w/x/fRnu/JV731m
 qYsgEMvQll59IYZgS/296lesCo4fwMsKfelUemW7sLlPA33CTEy8LrnIbs8r+lftiK/9YX8d0+C
 /m9u1k6VlSgOqDA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Implements wiring for:
 - SGM2036 linear regulator used to turn on the focus coil [1]
 - Dongwoon 9714V focus coil used by IMX519 camera sensor [2]

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
David Heidelberg (2):
      dt-bindings: media: i2c: dongwoon,dw9714: Document DW9714A and V variant
      arm64: dts: qcom: sdm845-shift-axolotl: Add actuator for main rear camera

 .../bindings/media/i2c/dongwoon,dw9714.yaml        | 14 +++++--
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  | 48 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 3 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260416-dw9714v-4566465ebe7d

Best regards,
--  
David Heidelberg <david@ixit.cz>


