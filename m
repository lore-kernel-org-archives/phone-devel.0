Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A221A457;
	Sat, 28 Mar 2026 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699506; cv=none; b=iv+Y8UzPyUh90p2umndvEkOJvzv+ltD8DIdlK82HBxQhoDxgW+S8ZEZH3Lmo3YJdUZUfWhWAMO8hE0x61UNqqI8kqlU6eRCJxnczZJLLxDBNloLmkEnsDDWm9T5y5zzSg2ee1jrwfFJrTiekv1H6l91zgkSi7sc6h/tIN2fjFrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699506; c=relaxed/simple;
	bh=iEyN33zGewc1XgxgB8M5s8QhjAal00jdoinGDPErVIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qno7cgHShNUA6KssPCkxEYhRrXBPEcy01vGFA6i6LphywZRfEtQqR42LbYcTSGovFWqGI0KAgxHX9KWlqr20VD03Oyei1rxntfT7Y4XCwT+oCY+oNUJZ1jL+xhs2809PvgYdcNF8v9apwCIn/yQUdAu6lp8Yek8i3qb9K4ePIho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIOybRmP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIOybRmP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54D5C4CEF7;
	Sat, 28 Mar 2026 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774699505;
	bh=iEyN33zGewc1XgxgB8M5s8QhjAal00jdoinGDPErVIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIOybRmPqc96WQ8IxxFLC3eHKhUHPTYyTIUa3mNXJAkS2YkdXna7fQ1F9OYeLCY3B
	 C4P1wyNTprfbllsGsihVr3Jxd0mmV5J74/aqzt4xSCiKpf1ZnaUg3BuTjHo26al1qD
	 lApLQonO+DLVcbmisHKBIEulCAcSRbfCe6Sd6wS9bQTmOw8+FL2dohPEc4ThzK0UCW
	 4vcL71XpvclwlwuBmsH3jVbdedv2+oVNCZo3XjtyCEUaxKaYfRzaffCB5Cdr/FIPqR
	 74edaQmmfIKtWVfFFCVuXS0MscQgNfZtf3VTrXpbxtw4Ssy9KE1RwsmdGVlFwIM03C
	 DBLFnEGBWRErA==
Date: Sat, 28 Mar 2026 13:05:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: display: panel: Add Novatek NT35532
 LCD DSI
Message-ID: <20260328-nondescript-bipedal-cow-39d00f@quoll>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-1-06edff9c4509@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327-rimob-new-features-v4-1-06edff9c4509@protonmail.com>

On Fri, Mar 27, 2026 at 03:30:47PM +0100, Cristian Cozzolino wrote:
> Document Novatek NT35532-based DSI display panel.
> Since it's not possible to identify panel vendor nor id, add a suitable
> compatible (matching the device's user, which makes use of this DDIC)
> and set "novatek,nt35532" as fallback.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

