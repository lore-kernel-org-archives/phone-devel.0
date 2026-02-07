Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12928302756;
	Sat,  7 Feb 2026 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770461482; cv=none; b=RbOVrSuZEjephP2YwRO08xytO5TfQ83srnZ0HzcqZdxASXowiA85qmhZbPBW5ZZFpwzC3I5QeDp9zGeox4Lx6PdjL1YIv5TN0INfUU6HVciF+kNCiFgN0zUjp/fNycWD2uV1NusQ8HR+abeqTwLt4SX99qD1ZLwn/qavsSl6D8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770461482; c=relaxed/simple;
	bh=7COmJBYpWmIF+5G8iwqi9ALnilsYuZL0dPcrXEBiApI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCKPuRzlYu3VrE8wwRmVMAHMXvUV1eHIU/CQISnufciBuwu0tmj01I8SrJAlgBlsgSSQkEeQrnSBiTUHcwV+9wzPFK972T8KvGfUdzC46rS57lAteL+bKHaXqPAydB6VVBpcWpffMuzXJBASEaeyIanrHuXp/7baXkLwEPNbSv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMdpeVeG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMdpeVeG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1835BC116D0;
	Sat,  7 Feb 2026 10:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770461481;
	bh=7COmJBYpWmIF+5G8iwqi9ALnilsYuZL0dPcrXEBiApI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oMdpeVeG2KfNHqGHHL3EZdIsvT6oUuqLWyD/NGEud31NGYw43m8gl0v2l00aasrQW
	 dNluG2PF6XlhU04zbLO+cX2Zq60WYPUP0lFvs+XC9zES5KwdUf8JAMA6GDY1SPXoeR
	 X34w4ceosX7mkJRZ9SisEZvxUJlg5z9CwfCKaXRlEnOGiN3mSMlGrpB11pvudbbedB
	 qGE3CkYzQJrDPKxwos3fUa4eUnlo95WsZANikd5Bnk6SPQkMOKy+xHhNm1V5gUR3kB
	 r3EGcmmMWbHw3LJVph5pTWNqqpTALgW+xsTXbV5dNOOQ7pK2/3Vve9KPbpLmF5hJSq
	 lG7uo1P6H2eLQ==
Date: Sat, 7 Feb 2026 11:51:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add mt8516-syscfg
Message-ID: <20260207-tricky-strange-swan-6f11b0@quoll>
References: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
 <20260206-mt8516-syscfg-syscon-v1-1-96dcb37acdb4@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206-mt8516-syscfg-syscon-v1-1-96dcb37acdb4@lucaweiss.eu>

On Fri, Feb 06, 2026 at 11:20:48AM +0100, Luca Weiss wrote:
> Document the Mediatek mt8516-syscfg.

Which is what? What is syscfg block?

> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index e57add2bacd3..a67699f1faee 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -91,6 +91,7 @@ select:
>            - mediatek,mt8135-pctl-b-syscfg
>            - mediatek,mt8173-pctl-a-syscfg
>            - mediatek,mt8365-syscfg
> +          - mediatek,mt8516-syscfg

Why aren't you placing it with all others mediatek,mt8516 syscons?

Why this is so generically called "syscfg", completely not looking like
a real name from datasheet unlike the others in this device.

You have entire commit msg to explain that.

Best regards,
Krzysztof

