Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D4E3B8BCB;
	Wed, 29 Jul 2026 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785354538; cv=none; b=R7aXdyUy5UhgJtG07khfOepkU/YPqpxYHZgydfkm5js821FaNtPxs4gZh5wBrUMc/rtTO7tqpWHPyQwoxx2WOeE0cx/z2YKtC+Wz6XisgVEFsTlorzESYymuHAnokDtJWrCQAMHA1ht1k2pblVsyLoAcULAQUSFl47wIyU5bTs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785354538; c=relaxed/simple;
	bh=SWisuBb4nkusEArnjWhT2oFMW033z9vtu3jY510Jhno=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FvqwiwKl4b41PPTi7x9GWlldAzu8S03TYyZPuWDKBzQtaph6Z1Eyc8850dBLECgz6LdNiYWhWu86SxTKyXflTdwEKyLV+WhSC73gODvQCLy/mG3FUBIzHy5gy1z833UGAy9vxvQ6JSbAKxn7PB6c/65MsdSywTM3/5qACRLe5ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dg1StLal; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dg1StLal"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BE2EC2BCB3;
	Wed, 29 Jul 2026 19:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785354537;
	bh=SWisuBb4nkusEArnjWhT2oFMW033z9vtu3jY510Jhno=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dg1StLalYMOahodhSpN2BD2hl+9cs79WgRzdVDFtzkUMK1a1S6C0anhUIR/ijtdtl
	 AXb1llrKqVrUnls1GK7mr9zCsOwGwatQCv85Zrlej13vviMDGt2Ix0DFsKu3YabHhU
	 Ua91Z+4pAANFkoPgWA3guu0LYsZ6PWKGFGnma92r6ayAqGhTLisXkv21xe07DY/R0L
	 iWmURdoL+dUDvyurBN8SwGnLNqTKBTL7PpgfTQJM/5epN3wGrMTVZlc+7JE4Yn+LB3
	 vXKXNcuJWc9Wc5xsDkNtMADUY0L9hjhn0OyLxe0X8ou1vRvP4rdwLMbkZ6kNmjhuKq
	 dNGzJq4YTbTUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DBAC54F51;
	Wed, 29 Jul 2026 19:48:57 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH 0/2] Support for pmic-glink in SM8475
Date: Wed, 29 Jul 2026 15:48:23 -0400
Message-Id: <20260729-sm8475-pmic-glink-v1-0-c2e1967c04de@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5DQBCA4VeROXcSXV1LX0UcWIMpluzQNBHv3
 sXxO/z/DkKeSeAd7eDpy8KzC3g+IrB95TpCboJBxSqNjcpRpuxlNC4TW+xGdgNqQzpt86xRdQK
 hWzy1/LueRXlbtvpDdj1HcBx/Vr/GmHUAAAA=
X-Change-ID: 20260729-sm8475-pmic-glink-57e56f98d2b3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785354535; l=877;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=SWisuBb4nkusEArnjWhT2oFMW033z9vtu3jY510Jhno=;
 b=sFRd8CMMnhQdQrtQrgSDCqW6VvcJtydCsQOzOuZgpBbUzIgLay6BbaHKVmU+ZQYXrhi+6DIhb
 fzAcjWx7yamC85Bfra7+So3MdluKO1UczF8zErZRbL/wFFZ5vnjFPM+
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

This series adds a compatible string for SM8475 for supporting
pmic-glink.
This way, confusion is avoided, because SM8475 takes most
(CPU/GPU/reserved-memory/etc.) things from SM8450 and some (PHY/eUSB)
from SM8550.
Instead of using one or the other, add a different compatible string.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Esteban Urrutia (2):
      dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475
      usb: typec: ucsi: ucsi_glink: Add compatible string for SM8475

 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 drivers/usb/typec/ucsi/ucsi_glink.c                             | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260729-sm8475-pmic-glink-57e56f98d2b3

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


