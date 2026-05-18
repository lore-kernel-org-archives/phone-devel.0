Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1630E3F6609;
	Mon, 18 May 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105640; cv=none; b=iqqaak17VJZscIykqbqFXDqQWqPhS224B0Qvutshqwje/wmA3FbsTIdTbky1/OhJBUY+NQPGDmapexl2bAG8hX97LTbk71FWZIkrRqY7ezKJ5CG2T3nUaOTAd5fUs2FzT6gjWFy3HO2nor0AiNhDDmuGSvS+S3shrE1y2iAE6LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105640; c=relaxed/simple;
	bh=9Fc58uUMjaSHMbxwgnLdGwYzmLlHJTGQ+EfCIzddzro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQQzkxhj1jCXORbWlNH5DvurOJhHWZKkoeGhPfSwMYU+2h7ffAJLBwO+TW+vd5H6SLTsqrUfX4llSkOspUXfxnzv7Vy1WUY0F2Zm8+JoyRfJKEi7Rj07iVgpdJZuCE9XzJc2w7QbEvHuQHfhqgPMm+4R2exhe0wW6Jn3jyGpY9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZffnVxkk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZffnVxkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0E6C2BCB7;
	Mon, 18 May 2026 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779105640;
	bh=9Fc58uUMjaSHMbxwgnLdGwYzmLlHJTGQ+EfCIzddzro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZffnVxkkT9nAFK8V8mD+8EX36l6KseXIgwbxzG5vsgI3ZY94GXdOy9MpurYsIyqYn
	 FfWsjxhNgVzunOM13uByE2ZzGxroKC7dWMDjwtXpgdWSu7EX8XZ+9eUgA1c3oGp1lg
	 R21b5yqABJbs9TiwS15yagByHYhPecqUvrS3PlFHiqSK8tOnlh1vUYBL/2DVqI9xhP
	 eFgupbupyyHI6jECkJaxtlCDdFxqYWcq2pSdrCyEQOmzVbzyJLagTDoGsD0w4GBQzx
	 PTrV5SUT54LOECeLdLs0RJRTjuq+1IfqG6oe5xagGsUO1bE0foJV/PpVkfYc/7UeXd
	 J/T2snFI9irpA==
Date: Mon, 18 May 2026 14:00:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	MINETTE Alexandre <contact@alex-min.fr>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: ci-hdrc-usb2: allow up to 3 clocks
 for qcom,ci-hdrc
Message-ID: <20260518-energetic-gabby-groundhog-6a9ad7@quoll>
References: <20260516-qcom-ci-hdrc-clock-fix-v2-1-aaec8d33d0aa@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260516-qcom-ci-hdrc-clock-fix-v2-1-aaec8d33d0aa@smankusors.com>

On Sat, May 16, 2026 at 10:53:14AM +0000, Antony Kurniawan Soemardi wrote:
> Some Qualcomm SoCs such as apq8064 and msm8960 require a third "fs"
> clock in addition to "iface" and "core", needed to propagate resets
> through the controller and wrapper logic. Later SoCs such as msm8974
> dropped this requirement and only use two clocks.
> 
> Note that the existing apq8064 and msm8960 DTS files currently specify
> the "iface" and "core" clocks in reverse order compared to most newer
> SoCs DTS, which causes dtbs_check warnings for these older SoCs. The
> dependent patch series will fix that clock ordering.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
> This patch updates the ci-hdrc-usb2 binding to allow up to 3 clocks for
> qcom,ci-hdrc, to accommodate Qualcomm SoCs that require an additional
> "fs" clock for reset propagation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

