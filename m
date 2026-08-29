Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081293C5DCD
	for <phone-devel@vger.kernel.org>; Sat, 29 Aug 2026 22:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788042208; cv=none; b=hIeHJhTIwBS6WIusa6wrpg7rhOnpYkHCVWqBYuzpALo5EsUIInQoKQ5yw12tvD4LpaT4/KHXHf049Uyt94HzbC5Xyra+FQGHwYpRk1pLr1+iQwKjRyFR/IyYDS7i/PnFNiuSoah0wwh/qQkOEwqOypdNh3L/egwXZlHxGLQlZBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788042208; c=relaxed/simple;
	bh=yvQNbB4WsqUjnGquebHPVDRLjeNDGpk9WqWIK9AQ75s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nFmTiPiCpTXv2Lp6+iVK9a90tlgsj2uGtYW+M8MOXSdG/+PHN6mqqHDJ/j17Ukugg112tayGWi6qcAD1hBms5Ie9JkcZAFP7ny6hdLIt78siyqDu99daXWvxHZE0ZBLT5+WhCcMhLXyd7HFDT3YikfRwganaMsdNBSBWRrc24rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K42toNLC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K42toNLC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D1DDC2BCB9;
	Sat, 29 Aug 2026 22:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788042207;
	bh=yvQNbB4WsqUjnGquebHPVDRLjeNDGpk9WqWIK9AQ75s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=K42toNLCyGCSLSlcUB/B/vVDO3/Lv5km8Ad0+KUFXjIAHandgYxw1YAu4ICPqWWAz
	 fv03TR2Rg+Bye0MOXj+Gk9uCPYKS25RmXYppI75LPU0XLXObwwcmN/TPZelUUD25bR
	 bjNpPi6jKMt6N8h2iOGbuC671m88ryPuLJo94T+J263SB7XOAgpeHYFOWZFnBhWL7w
	 raLV7LRldGqejrITgEaWhd6TgQt5QWE6YI0vMWMkDp3NBDNpALbBTwtnVVUV4WOgwF
	 icNceUeFgpqkou5xLPmOJ0YZrQ/iozWQW25sIpVL1YiI4NfBifgQxVLt8d85gwzU5q
	 9mRU+BcMlX25w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FADC61DDE;
	Sat, 29 Aug 2026 22:23:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/4] sdm845: Configure USB3/DP combo properly
Date: Sun, 30 Aug 2026 00:23:23 +0200
Message-Id: <20260830-b4-sdm845-usb-gadget-v1-0-9f20e842d628@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQalrSXqV0YTLTdAStZGIRx
 LsbdfkW/y+gnIQVntUCif+i8hsKrpcKwrcdIqNQMdSmvhvXGPQWlXpnbzipx9hS5IzBNp5dIPO
 wBCUdE39kPrav92mdfMch7y9Y1w37SnxeeAAAAA==
X-Change-ID: 20260830-b4-sdm845-usb-gadget-c43be8cd094d
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.denx.de
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini <trini@konsulko.com>, 
 David Heidelberg <david@ixit.cz>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>, 
 Jaehoon Chung <jh80.chung@samsung.com>, Peng Fan <peng.fan@nxp.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>, 
 Federico Amedeo Izzo <federico@izzo.pro>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, phone-devel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=yvQNbB4WsqUjnGquebHPVDRLjeNDGpk9WqWIK9AQ75s=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqk1vdf01OlqMt7OVfNSc8ox0Zausqsk8K7c8Bq
 g0wwO+0cdeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapNb3QAKCRBgAj/E00kg
 coSLD/0aI2vzfR8cfP+8jNf+HzKRnjxPXqClKSmX+cLHhKjTKYeG8BE5ySUQhv2v++YJIJWP1lh
 kj1wmMIGeZME1BJNodryFWCg/bTzLK1m/KjUMfn4wxBipHBKy86pQT4YpSoCIAcPDqewj48kPEJ
 xydrquRqsqON3EF03IEkMmdNzEA5UtHWbgziZBxUfnH/tKLEDP29Rl6wj4iSqfbXJ3IbjWu5kbN
 UQq9c9+8yAJCgZnTzBGhMDSF5ZBRTz0BjpeuTKuiaEr86ABEYVi2Rk7eCGpVWbrn52aEkSjv7Ez
 UZhIlSGJ3nE0wAEFW3yN8z+BCz05TF85PWfzRMg5wKF3+519XO441RYzOlHZS04L8Gm6HAGRjWQ
 Ej62e+spLxbsK5Rq0OiywRBaGsAfLGVDzNU3KnUZ4id5m5ucuSvd2bhXPy63NF0LT2FB3a4H09n
 wzjOvWj3XCO4EIfsnxeVRVwKeZo+PamDj5rRQM1xWtwsBw6oVVWlno6/J7frODe/5wOdiactJzB
 8bV8qOX2aMaL/j94oU2Rytea2QDPwnKOn/TBIs46yR2QjwIHzkk1xVBPf9x+LYMdT37x1Z0oAsR
 3xJVPBNFvtPUcoKrMOBdjmJ+vmWo0h4oBu9vUwlIocPotkOHfnJ6jvw7BA/qtrupHT6A4C0b8rO
 PQ0ZBJWJYcLtfPw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

USB gadget mode nor serial console does not work on some sdm845 boards:

  dwc3-generic-peripheral usb@a600000: failed to enable ep0out

with exception of the first boot.

This series implements "qcom,sdm845-qmp-usb3-dp-phy", so the USB3/DP combo
PHY is never bound, GCC_USB3_PRIM_PHY_PIPE_CLK has no source and stays off,
and the DWC3 endpoint command times out. It can be masked by an earlier
boot stage having left the PHY initialised, which is why this only shows
up on some boots.

Add SDM845 to the combo PHY driver, plus the two things needed to make
it usable: PM8998 regulators, without which the PHY cannot get its
supplies, and the defconfig symbol, without which the driver is left out
of the build entirely.

Tested on Google Pixel 3 (blueline).

---
David Heidelberg (4):
      phy: qcom: qmp-combo: select PCS register offsets per version
      phy: qcom: qmp-combo: add SDM845 support
      power: regulator: qcom-rpmh: add PM8998 support
      configs: qcom: enable QMP USB3-DP combo PHY

 configs/qcom_defconfig                        |   1 +
 drivers/phy/qcom/phy-qcom-qmp-combo.c         | 168 ++++++++++++++++++++++++--
 drivers/power/regulator/qcom-rpmh-regulator.c | 137 +++++++++++++++++++++
 3 files changed, 299 insertions(+), 7 deletions(-)
---
base-commit: ece349ade2973e220f524ce59e59711cc919263f
change-id: 20260830-b4-sdm845-usb-gadget-c43be8cd094d

Best regards,
--  
David Heidelberg <david@ixit.cz>


