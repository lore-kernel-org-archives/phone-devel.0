Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B73DDDD1;
	Wed, 19 Aug 2026 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147801; cv=none; b=dUE38DOMCGXFvKcWH8DQFprkDN21hpzYa96qaCdJsyUJuNgmligo+sRr8Go6XNCPXebqtFJRW7RM7zxfg94mSvu3HVgRjwAhBpFw2GZ0L4mXaVr/WDcQ6ArtpvNxghsIgSJCw76jPdSNUXDzKJtXSlgCKIbrTfZgqoocEryC0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147801; c=relaxed/simple;
	bh=e5ElovP1SCECxirXtW4TEymqPOWYTGsG0NVtgBZtogk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jNDT4Lb0nIQxr8voJiUIhBlGnSsZQB+8fgIvcR5XFACj8HBJj+CUH5xVhCsgvaiybeaxjNFIJqC+KclPP0IvZW7g4416c05+UEyxG+j4c+8jwleyHu/UVugE8+P8hAznL9pt7W7z2yErzYtRPfP0m+DcUEJfputBxEqAV/hY5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLGSBFAo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLGSBFAo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBF88C2BCB3;
	Wed, 19 Aug 2026 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787147800;
	bh=e5ElovP1SCECxirXtW4TEymqPOWYTGsG0NVtgBZtogk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mLGSBFAoB4hSnSzapxSk5KDot83bEm1X1hD/vspZUEN3i5lJQfqlGygrbTA6dZrvF
	 PO0XlS1iB0F/3FSmkyokx8czseEFhqjLXrx9hbRJRxSevcexyE4SZSEqkhOA2lrnZN
	 6XcxSAA5mzv3Bp3axQCxOzGqo/oOA1WVbpBQyAvlyr2eUJpeQNgbiJ18UXakAZnOoG
	 YWKcy6q+x+KtHWTOmkk5qJT5LDo8DUstKwpf6MdctVh4Dogae4OPQTselY9fPQP8Lc
	 3DXrwQCmrq50eNAEmz6a/UyEhgkCG3nPswXLeI0Wm0EBQCl+ne0dS9wFmfUj6M9Npq
	 CYgUkmOOvMybw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BFCC5DF81;
	Wed, 19 Aug 2026 13:56:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sdm845-oneplus: Be more explicit
 touchsreen description
Date: Wed, 19 Aug 2026 15:56:38 +0200
Message-Id: <20260819-oneplus-ts-quirk-v1-0-0cdbcea195a2@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1IUqvYq4gLq6OOlqiZpBTEu
 5vq8i3+30HIMQm8kh0cfVl4sRE6TaAdGzsQchcNRplcFQ+Ni6X1EwS94BbYzfjsytwolTXalBC
 z1VHPv2tZ1bclvCdq/f8Dx3ECSHyzrXQAAAA=
X-Change-ID: 20260731-oneplus-ts-quirk-5d962004a129
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcus Ramberg <marcus@means.no>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=e5ElovP1SCECxirXtW4TEymqPOWYTGsG0NVtgBZtogk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqhbYX9lDvelYDg8+CpZ5TqqR4YrB8qzclbP0md
 ewKd+kYaJaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaoW2FwAKCRBgAj/E00kg
 cozWD/9dgC/dYF1CYKHGfPjxnua0hdVkkBErY0glo23VYp2Yuq4YLetwojX3o0Fcw5HKLqXZoYn
 snzCa7UYA6E2FqfzWonHW5uRu1Vw2lWTFrgxqOpt6164scc/23E6K9/7Y0+jzqYppfypz7P2g7B
 iiEHogcw2+fqYPq1qrmN5tSVmM7tJRuEy61idxLN5ki9YfD7K1FuJNblMX6lDu2B3D8Nc7e/7z1
 vmGH+O2RLDDxlVZq67/brfG8bIklHW1c0CcELZoy+LqYMYjTM2AU8PN+wFbk7sNYXOYfaJA9zJf
 1kOlvMCkWpf7r8AwdnCkow8FIsWLNliEIoyPwXkqGuiU5em8ozYTFr1oUCfs5jGsMkJ8H8FZB5a
 CJMnlctnyrh4qYfm/YhlWw1cFBOJbmJ6PprW3EQoXt1olP4MVPpyIQ4vpNbsBPDYkk69cwcNQ2j
 IgDOgj4IG35ZC6Hhka30kAaPOombBguBIzXBzfCD2Amv+YC+sRGLciOjpqqXoJHwqSIwYqo8g6j
 0l87RLYY27qc16uyihm21p9GHzJCbK6zJT5xIpswSTr02TBlkS0/Mu1LBTfg/aNtLUoonegDjhm
 o+zsPf/RN6/1BNJgFx5XUV4AfH/mQXiT4fy7NdOW4lkBjDG0R/2eXtKh/JvzBcDyY7LBdu6v/F5
 LlMd8slR4cwg32A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Useful for aftermarket touchscreens, which don't fully comply with the
standards.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (2):
      arm64: dts: qcom: sdm845-oneplus: Move touchscreen y-axis to the right place
      arm64: dts: qcom: sdm845-oneplus: Define touchscreen in the detail

 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 5 +++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)
---
base-commit: 5453bc3279e9f8578ac3e534d476240e40c879e1
change-id: 20260731-oneplus-ts-quirk-5d962004a129

Best regards,
--  
David Heidelberg <david@ixit.cz>


