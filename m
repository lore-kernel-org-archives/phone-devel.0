Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA54E389470;
	Tue, 24 Mar 2026 03:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321566; cv=none; b=ukqlDY+u2yOfLWdHrt141mEpIz6+um03mpVUXwj4pmRd9y0TOMYz/ztwyTvWAuwncVge6Z36va6VUlRgj99Vf436PiETcfmVEeFAWk6R650f6BtcxLpld3mi1V/nRdSQgZwo2dSwbNCQ8k+4NnURgnw2Go//cElJwjNGzB9iWMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321566; c=relaxed/simple;
	bh=kDjTBwLh7iKxxXgqzNaOLi8nACa0drh31Nm+ci76kAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7NFgm4SPsMvY83FwXU3U8lrY/p/ePkNIMlQ00Ayidi6MdXsbLwIsyz1GLkOmtQ/Odnf3Ij19pLuRYYa2/tF9XeuOSPJPbNEn9037xpZBIfZ+bQltTD35O5o+aYT4IkGU81obiYKkgBmZxvIZpTF8vCv5cnG6MOA+S9JB3Dj3+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJ6otrrQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJ6otrrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BC4C2BCB1;
	Tue, 24 Mar 2026 03:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321565;
	bh=kDjTBwLh7iKxxXgqzNaOLi8nACa0drh31Nm+ci76kAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WJ6otrrQeQ18r421OzZBkt9+h1sCbzfj0ue67592JcM1k3DS5T3cGUQkcIklpI746
	 SDrzV4pbmJYd5O1BMNEN4bBGogBR1TXXNOLAAIneZU2H5exMo/5yseHHrmE6XOOth5
	 SUaQVwqjlumAQrYkHtsqYMb4mPl8LxqenIhudwwUy8LFQuEK3h8nSPfmmlmAjptVpx
	 kSkT9SwMUGZEVNhK7DXlpcIPIrm5DvHbNSYfheITQ7IqadjdCMOIFbRpD0m9rxBY81
	 fyaEYZaWFoTwlb6RYh37p5uB1CjO4d3fgSc9ApvLtf7CtufS6HEGhOnnKlWVm4IU5o
	 tUL30gKnVd8Yg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konradybcio@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Mark l1a regulator as powered during boot
Date: Mon, 23 Mar 2026 22:05:50 -0500
Message-ID: <177432155632.28714.1991404860482205009.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320-beryllium-booton-v2-1-931d1be21eae@ixit.cz>
References: <20260320-beryllium-booton-v2-1-931d1be21eae@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Mar 2026 18:33:11 +0100, David Heidelberg wrote:
> The regulator must be on, since it provides the display subsystem and
> therefore the bootloader had turned it on before Linux booted.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-xiaomi-beryllium: Mark l1a regulator as powered during boot
      commit: dff3c181e4115815e138282f04dde0a5d0be1cbd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
