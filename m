Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F6427A476;
	Sun, 12 Jul 2026 03:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825963; cv=none; b=BqYUvoda3kpmnQXWyi5owI5Kg5/OqPMautKeO5/e6ORgCCYsJynQH+iMAXWkb1RNJJSdr8/gkSUg+YsO737R+3MAQFFh2gLfZVdF95AAz5eA3v4rGYfr9EIYP8fLKN7ysEY9ewZDdDxVTo/LdOWGjndL4BwEKA+fRoXev26IaWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825963; c=relaxed/simple;
	bh=NH/8HgVWQ4D5/65p5rKmhBa0mt3P4wWICYWvIbf6n9A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZvNMFiSEhfFeMBn8YXLXnINXrlraDSkrBivu4/euA1UcnWw01fAmVajUFTwfq2oazbgpJNOUH0+W5hGTWly+B7mUojAWANH2zJ34t3L84JSftpPJqk8+w/rKetofKcSBXFAEFxqECYaTliiKgzNRlKnf/1PNg8t7wdr7hsMnGKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXdAbHIP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXdAbHIP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F9B4C2BCC9;
	Sun, 12 Jul 2026 03:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783825963;
	bh=NH/8HgVWQ4D5/65p5rKmhBa0mt3P4wWICYWvIbf6n9A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=AXdAbHIPpdPPk0kzFVlMHdKrsPwCLnQuJL3Avu222QKjDDYZ+1iRtBG1d1YTAy/2n
	 riLAwH7Ly3wYp+qrqnwyilHXw16EiElkuAUSvveEPJqtO3bV4kS/IMGcF5/RiCXgvA
	 CsKpt9SORPJFWobowreAirgUl8kBPYjXFPRtOAtLHGNrgK+FRlfW3wHvGFvr8dQcpI
	 7AjWs0ksDJOeKo+Seu80rMr/LU0nbNBbIxbuynIRqK+ad2T5y+gcLzHiw0JrZX4rG3
	 l/ZHCqW1/cOkFVhZC/lcmSNOyg1Ltm22KNiTfABGA5jTqo4/A+b6mzfYLgkbSzdXnj
	 7PxnF9M98RlYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F9AC43458;
	Sun, 12 Jul 2026 03:12:42 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH v2 0/2] SM8450 QoL changes (dts)
Date: Sat, 11 Jul 2026 23:12:26 -0400
Message-Id: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBBFf4XM2jFtESis/A/DAuggNUKxU4mG8
 O/y2Lg8ybnnzsDkLTEU0QyeJsvWDSuoUwRNVw13QmtWBiVUKjIpkXt9SQS+3BNNYNR5nFRpnSd
 aZLCORk+t/ezBW3kwv+sHNWGrbEZnOTj/3R8nuXlHPFXqPz5JFBhnpIi0aXNTXUfvghvOPUG5L
 MsPOvRxHboAAAA=
X-Change-ID: 20260711-sm8450-qol-dts-8935a6b95807
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783825961; l=861;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=NH/8HgVWQ4D5/65p5rKmhBa0mt3P4wWICYWvIbf6n9A=;
 b=Fs+4F+B99IB18w/SxUmpLUkDUw6GNdE7FGLU93COwPWF5+MIDi1oBj63322RPohbuDddO626J
 RW2imcYr+KfDc4a7qXa3oV9jLR7/WOYV2tyl77ecVv9wQt7mANPnM47
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

These patches focus on correcting some details on the DTS for the SM8450
SoC.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Changes in v2:
- Split series in subseries (dispcc, dts, qmp, smmu)
- Add mode-switch patch
- Drop applied patches
- Drop GPU operating points patch (existing map seems to be OK)
- Link to v1: https://patch.msgid.link/20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me

---
Esteban Urrutia (2):
      arm64: dts: qcom: sm8450: Remove unneeded reserved memory nodes
      arm64: dts: qcom: sm8450: Add mode-switch property to qmpphy

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)
---
base-commit: 96615101b3caf73612f80a217abb9a0da0effbc7
change-id: 20260711-sm8450-qol-dts-8935a6b95807

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


