Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790E2395AFA;
	Thu,  2 Jul 2026 23:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035666; cv=none; b=Spy9Ae5GYCI4rieUojkS+qe5Q3z5hEZbDCW5pyXhiwW6A9+qZzoKxhKvL0PN/d/u7wBus7nam5zi6k7qhIT5dobBRLVDte2gP+FEN/pdj5NbuwfxcEfqvHBwRTGFFzy5qxU6FT+uyoB0zwBtcbDpC0UO4goNDjpf1mQTcW9KESs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035666; c=relaxed/simple;
	bh=VWBe4qeQKbSPAFW/Soyk8TnvXZV5R9GHyvUIGuPB3sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYSR3K1SE2oXi5Sh3NzX+hXK5y5xgS6BGu12NWNxR0SZYpKrPxA+8ofSxwQQHKaJFv0N7ycqmcnZ6X9fGGJ3+19SHaWUuCXQv/BwRucM1rrnSzZ94oYVx1jVhz+SlLm/jlBysqXfU4SLaIAiE+AYOKVKWULkNG2HZgl1thy61Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6aHjh+r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6aHjh+r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561131F000E9;
	Thu,  2 Jul 2026 23:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035665;
	bh=b5iAkywzsA6Uwn7YWW077Q0aBOPUzk09mNaluShF4xM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I6aHjh+rr9W4lDyGkiN+PlObSGzTyf60RIuWerlBblKhSNq6XUyy8M/xbzofK4UrX
	 ge8TLz/hDMoaDj76DNFy0WClrLF70A7AnQrjokjXKDtTs+qS8EvTMftrXw7Rp8xvSO
	 0Nfh65wSNfPIOi1zRfUwRtKhVn9QgKDpCsSFTVFGJy6X8tnRFnylGQrNffjuWlKoAb
	 QS9iIfuO6TCoZ+lqIM3BjY9pq+eJ2H0+SCNauNbep/Yw4ZZRJJ1Z11mGr/EeXzU7Zz
	 LFCeKjUVEdpPtRliuLYSmC+INvOsR8wMp1psBIdX4Amrqv2tr2y+Ck07wFt+choRHt
	 F1fPeZ/meaugQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/2] Describe IMEM on Milos
Date: Thu,  2 Jul 2026 18:40:39 -0500
Message-ID: <178303563650.359079.10125285909588967551.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Apr 2026 09:31:05 +0200, Luca Weiss wrote:
> Add a compatible and describe the IMEM for the Milos SoC.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: milos: Add IMEM node
      commit: 1b3ab2f3f1f4970cbd992a02bcc5f90551d67966

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
