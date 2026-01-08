Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DB03242C8
	for <phone-devel@vger.kernel.org>; Thu,  8 Jan 2026 22:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767910383; cv=none; b=unZKt2yTvWUq1DP6G/T9tfXOCJXJW+lcOaq7OEXAsvW2vij2rQYHBKhmENVSqPHG/C7UPaLBIBk8fy8SsthVERLRrDuU38bMsCUUhVIVfj2MVZYLv3ZmVPA9viLbv3pVHcWlB5jurewmo8C7wLrt0VsVX2a+9v1w1WOXHDaX3lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767910383; c=relaxed/simple;
	bh=Btre+W9rXfTntEbWir+3D2MhegCB4vsVPDfdX2a6Dek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fet/iVOKXuGwNACtw9xq+qsdl8+9Pzi+Ju42l97tKOAKAcaC04ZrtNLyO72xtNXlqeMtBSJFm9TdBd/zVcKaoUD5LCjSAybYTc7dezFpixIKTLXMU+BxHP/Y0Q6DU+06o3FP4JU4ZN0D5AtZ9VrC4NK3KfEpfsRmUqBA0ASK+rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0rvcJg+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0rvcJg+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF981C19423;
	Thu,  8 Jan 2026 22:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767910382;
	bh=Btre+W9rXfTntEbWir+3D2MhegCB4vsVPDfdX2a6Dek=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=S0rvcJg+LvBtvl6qu8Tr0rfLCMVfHFuZvTVARXU48yELBs+OpADdRE8e65gcBfiwX
	 MPQRPcd4ooNnElQEhI4NS9tNi6FQvYFyDlT75Mfk1iMo0S1nJmTZx6JKA/BV1592xg
	 dMSLP71bmKnLyq/uvmPscc5qe07EMZsGrQ0uW/cH5V4RFVKH1e4LRXTaEFXyVOoH79
	 br3AZXWgdBEHsa9oi46jCuGYWY3lCjz03non1qrQyvs6hR3IWsR3m9RO+I84PggTrU
	 pCMOn5MB6XqBPMfgrjsX0wuDQC1CL0rFwEXmai0t2/GjNXxOH7SRkMTtqZMJ20ZFwy
	 2XMRczddmk7vA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5703D232C2;
	Thu,  8 Jan 2026 22:13:02 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v4 0/2] Introduce Pixel config fragment for chainloading
 u-boot
Date: Thu, 08 Jan 2026 23:13:00 +0100
Message-Id: <20260108-pixel-config-v4-0-76a2212b69a5@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwrYGkC/23OQQ6CQAwF0KuYWVvSdmZUXHkP4wKGgk0MGDATl
 HB3BxPDhuX/zfvpZAbpVQZz3k2ml6iDdm0Kbr8z4V60jYBWKRtGPiDhEZ46ygNC19bagCvRnyQ
 EJ1SaRJ691Om+zF1vKd91eHX9+7ceaWmXIY9Hzglt7jEj8g4dAkNVRK0uOuorCx+z6MirOCEjk
 vV5xsScMNCWsH+x8Wy0gIBcsBdbV6EuVjrP8xcGkIPKCgEAAA==
X-Change-ID: 20260107-pixel-config-4b058ecc4e1b
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.denx.de, Petr Vorel <petr.vorel@gmail.com>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini <trini@konsulko.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Simon Glass <sjg@chromium.org>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Matthew Croughan <matt@croughan.sh>, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Simon Glass <simon.glass@canonical.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Btre+W9rXfTntEbWir+3D2MhegCB4vsVPDfdX2a6Dek=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGlgK+2gB9sgdp8yXtazzm0fS+wJ9BRrgxi+RjkT3c5e40PuD
 YkCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJpYCvtAAoJEGACP8TTSSByqtgQAIJX
 nCzTiuhCC+iDyJ9yeyaIy0fFDC2ZjAtqD4bLK0+WG5N5hAXfSGbyM8vizG8QddZ+3fYsmiMiSqu
 ZklbBRvMG2hyNfLwIaCjVYAZe1Fqkypsdrgm1kq5pMW45c++Tbu5UKAQwbQTqobyAAncQZoOkb0
 cXAJSWeT8wtpN88NgMt6iWdydcNHgLnp9KBMwV0H0sOzic3RuooK4N3OQ3+BLpjgZ5rbKf/MR2K
 b+Ik8rxhmhM+zWIGQR+dnuP3tFkuPEI9NE2HrG5kcw/mMaNgD9KyVvrNYzKndBL58NjTCw/ITDb
 YMU42y1YNnIrYQyrarpa//GR+xCEsA+myAm9UWlMHSjLlAPqMgbAp3AoLNBchc+X4l3pnH7Td93
 miAr1lFY+bhGKlWKI9lCrLr1YKs5aTGvvuAq+zTFkEx2N647Wn8HJVYommIZALE03PwEPVtzIti
 xO6gji+dBn4E0/tz94aCRaUzBju1xdexZdcAB6gzUL4FqKKFBN3ula9Cv1kJ02shQpZ0EE8xzHQ
 3USFgmvfL6/Paw8+fD6gley1ClJdVlKFPou0Ao6Pr3ybYMF8RJCaAKjUd2I0a2GL1/R46A91tFp
 H1M07uFCOjJV3PdEwoo5oquHCbnCCW2+YOjn6wpMNqes6p7ALHu29nrbbQUR5ncoMysGPbgizYN
 b7+Xt
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Snapdragon Google Pixel bootloaders require the TEXT_OFFSET to be
exactly 0x80000. Without this, U-Boot or kernels will fail to load.

This patchset documents Pixel 3 and Pixel 3 XL and adds the necessary
config fragment along with usage instructions.

It has been tested on Pixel 3, 3 XL (by me), and Pixel 5 (by Petr Vorel).

The corresponding DTS files (sdm845-google-blueline and crosshatch) have
already been merged into the Linux -next, so mainline U-Boot will receive
these devices support soon.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v4:
- s/CONFIG_TEXT_OFFSET/CONFIG_TEXT_BASE/ in commit message (Casey)
- Link to v3: https://lore.kernel.org/r/20260107-pixel-config-v3-0-02a25e3fdcfa@ixit.cz

Changes in v3:
- Renamed google-pixel3.config to google-pixel.config as it's not
  limited to Pixel 3 / 3 XL, but also 5 and possibly others.
- Reworked the documentation. (Casey)
- Reworded commit message. (Casey)
- Link to v2: https://lore.kernel.org/u-boot/20250802001359.2122103-1-david@ixit.cz/

Changes in v2:
- Added documentation of Pixel 3 / 3 XL into doc/board/qualcomm. (Casey)
- Link to v1: https://lore.kernel.org/u-boot/20250729103950.1154040-2-david@ixit.cz/

---
David Heidelberg (2):
      doc: board: qualcomm: document Pixel 3 / 3 XL support
      configs: Add google-pixel fragment config for Pixel 3, 3 XL, 5

 board/qualcomm/google-pixel.config |  5 +++++
 doc/board/qualcomm/board.rst       | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)
---
base-commit: 53c0d5b387956bb4070a943b61991898373a20e2
change-id: 20260107-pixel-config-4b058ecc4e1b

Best regards,
-- 
David Heidelberg <david@ixit.cz>


