Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D8835975;
	Sun, 19 Jul 2026 17:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784480524; cv=none; b=U6Vg9vP+C8YZ6AAvT/cS4KfcTwYs69IDIJb4jM/Ag7Qd6yQ1hw1I6EA/YEi4PFeQkxVcgREOgB1kqdm/aGVmxwVzAdgVmvIkJrdnjYCUOm+8B+dxHe+esgcPgJ2ks4JCGs/bcPeaES3tlr+anO0cYfLsnKl9cQ9HeACKs40AW9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784480524; c=relaxed/simple;
	bh=+PU8QIp9/XHxdwHWDpQ2VacOUpMn8BWI7gFOK9TucU0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N2j4yHVhxHGzjoqBnh9kCsrQXnMnLmELyH5lPTSK58+dUndyVbX3gmolaNG2UDBcZ/LiR9pM4b8IAVaYIpiMDoEsHT5rrRaF8le3yiniHl7d0wmZuZn52ymFkmiOQDhmq6PHtbmo4KcfH9IKhkYEOkAZtNmlJML8ot9rSoYxzc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmbdc+iW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmbdc+iW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91157C19425;
	Sun, 19 Jul 2026 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784480523;
	bh=+PU8QIp9/XHxdwHWDpQ2VacOUpMn8BWI7gFOK9TucU0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nmbdc+iWYNmLztkRLyhQ8Du2BUfFS/VmunNMX3x11jhDycWNIpVX1r1zb0HhSggkx
	 i9rAP8a3TUr/ICOiBEn8i9QiejzBsA/ppo5az2ClDPyVM4m4fftTis/38PFIfaMZpR
	 o0Y1brY3oFsvkpwo8iuAEtXiHFo+rfhNvIVcRzgxnjNSduPxAQ3qIJl9AriGelBJph
	 z4JAWni4DpYWsL6QfSpeSGYOxIZntgQxYuTP2RqmU8WVbpr8jQ1bCXQhISt4va3Vcn
	 OfBw5b1wm2DqyLy8hCRwqpYbOIcq5w4EKhIKYJzOCwsHzxQZVBOBEfGct2D8RZL8yM
	 xt8frStnlQOMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68264C44512;
	Sun, 19 Jul 2026 17:02:03 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v4 0/2] Add initial dual front camera and rear flash
 support for Pixel 3 / 3 XL
Date: Sun, 19 Jul 2026 19:01:58 +0200
Message-Id: <20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYDXWoC/32Qyw6CMBBFf4V0bU2nL6gr/8O4aHHQJgpYkKCEf
 7eIicrC5b2Zc5I7A2kweGzIJhlIwM43vipjkKuE5CdbHpH6Q8yEM66ZAEVr3+NZ0NxeMFhqjcm
 MK1RmEElk6oBFPJh8u33MJ9+0Vbi/9B1M7WySAAtTB5RRnqpUM61AOb31vW/X+YNMno7/ZXlkJ
 bgsM9Y5kPkvK75ZvmRFZJFrxwyzGoB92HEeFPB6i39p36vG8Qn1t1lRNQEAAA==
X-Change-ID: 20260315-pixel3-camera-a9989bf589ee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=+PU8QIp9/XHxdwHWDpQ2VacOUpMn8BWI7gFOK9TucU0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqXQMJcjISfHB30a4tMAg/ktbxc5I2wooci7E6n
 VtbbjhsKLKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCal0DCQAKCRBgAj/E00kg
 cq3BD/9nbfs6yrdCMkNrAdgaelzPH8pacDPYrh22xRSQYQg/omRFYdvjFu/fSYxUVndwlbR4+Ja
 uNO38elSL5gvQy4XnmER0VSIHqYeSFOgAN0+jZYbA/nsMODbc9gJd5allwK2Ip4dFfQ7NzezPcs
 +yUdduPhvvppUqeALJ9IKab1GB4io9iBXtK/YPZDoMlWBriV4BI90oQ5R2jN65YRS3AldkxM4si
 TXA78NtBy/QFzHa9yzbPjYB3mPagP5MUTSVsBPOKBlkY5UQYODZWAmmNOe7h2xL8FgX9pNSISlI
 LcXoQPypHGB/AJeKqa7ydyhLbIJWo7f3w8kvpRDPNU0f/SkyYeV1qpwsppT7IdSrI4QQDGu+zxE
 Rm/ARL/iXMnHOYdbFDBwmA1OX1BnBsNCmQYV8cipsBd+VnKkAq49t8bdZxjVD6ldIzjhCzwLbYe
 qDeKJK4lkfPeD0B+F7hd2UOZhEYOUUBaNJxZGVfsIJjsLEb61ZYw3g5S3BFweZSUKFmOZ2igFkQ
 hinRnWdiHvs356bBswlYf8/wuEgXg0ilHmVd9qWkoeJHTv7r88wG9dpX5GftjSvdBeGxDpr09Il
 Xp0qcNBU6Oc4nkyUKD8Snn2ZmEHHY3FxBlS4oE5O8Epw88ikJ9YsAr0Ma7pFKzhAfER+dgFwKSJ
 dPrcMR7x43gmDJA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Describe the dual front-facing IMX355 sensors (standard and wide)
and enable the PMI8998 flash LED with hardware-accurate limits.

This brings up the basic camera topology and flash support in DT.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v4:
- Use 24 MHz ext clock for the cameras, as the downstream does, since
  the upstream driver can now support it.
- Added additional LED, as the phone contains two separately controlled
  white LEDs flash (upper and bottom, in one module).
- Increase flash-max-microamp, as I took wrong "flash" from the
  downstream sources and dropped Dmitry R-b.
- Address formatting issues. (Konrad)
- Link to v3: https://lore.kernel.org/r/20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz

Changes in v3:
- Dropped cam_vio label. (Dmitry)
- Move the MCLK2 pinctrl from cameras to common camss. (Dmitry)
- Link to v2: https://lore.kernel.org/r/20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz

Changes in v2:
- leds.h include escaped the initial submission. Fixed.
- Link to v1: https://lore.kernel.org/r/20260411-pixel3-camera-v1-0-2757606515b6@ixit.cz

---
David Heidelberg (2):
      arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras
      arm64: dts: qcom: sdm845-google: Enable PMI8998 camera flash LEDs

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 207 ++++++++++++++++++++-
 1 file changed, 206 insertions(+), 1 deletion(-)
---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260315-pixel3-camera-a9989bf589ee

Best regards,
-- 
David Heidelberg <david@ixit.cz>


