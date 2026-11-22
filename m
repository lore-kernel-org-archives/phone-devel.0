Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369737;
	b=urN/bxLMySlTYlvgxqPeSuEKG7arSUVJHaj/yi0N6uWOPUMR6zasBRuWq2/rCqMlln4m
	 T4nNkzbnGN+VDAPXUM88AFo1YlUlmpP+o+SDPZWCWh8O0xYlq10NeLNfPMuo3J3zpkgPr
	 qZyT/Lqup6kO4TD20AJThkP3l0LrBGxh2VYY0jrfpc85WoADPMDooDEa5yzAKmgVottwd
	 8z6drawz9PmOV6KOsrQmY05LKykvKb7SG+q/Han+nGnk6dBDEsxuuiit1t5Fm8tBmF8zF
	 oWVWGsQJUj789o6scY1lWwpVxCCKHcV/PuOM0e1oit2BK7kzsHvWiuhcPB8nJsXsdJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369737;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZbHdvTZ3+uaHzIbZjQAd9lefWvIEB3s1xmAjOARxdRw=;
	b=EjUYnXnpilh0Tv9cv/dfWULPPX2mEM/TYzFilmqLVtnrP9Kr2yS8y1aUD62oB3moLxGi
	 0/YtTben4T8bO7ueQ38steI2O5ixvzpEOdCNQHnaMiGFsnbIH+85ZjXbC9pKGRbnpWgdb
	 S8jrffiolL0bXKcasfZ7Ia2KmZlEP+qgKnAoL4vApVAOKw0fc3wfIWmjl7dve/ve98n8K
	 hE/8wgTLqvkO4OAVYV/aE3TSsfps2J60DmVrea1X84LPQf6noSJ7BDUWl3qiMltbAQzJ/
	 bVLo72FHJwaiuTXxj6cqYRZoEpoDDKjjRCLhIqUYOmyg5KRRnO9IIlBH7eYlFclaSYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LN//XLVl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA4E606A682;
	Sun, 22 Nov 2026 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LN//XLVl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8121F000C0;
	Sun, 22 Nov 2026 17:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795369736;
	bh=ZbHdvTZ3+uaHzIbZjQAd9lefWvIEB3s1xmAjOARxdRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LN//XLVlqT+ewp9z64ZxSXc/ScSap1JKNER6uEVs21jFqlbuUOOeaE307BcUKJaA5
	 xWvCQ/RizDDEjHyPk/lMKCF4IzDrrkXhv7FmHp3DqYEbHZnvCwKrMiDFLlhLc7grvc
	 EpAbAwANnXCXGgP4BDIXr1y8r9qrRq6mODqnQuFQwF2TkVztXPja7nu042LIj5fKBJ
	 DNFl+XfQP8lrHmfZfFIuAoh7mv/XWMzDQZGLWZZ1XOqVv2VAK9s5fOxnywGJI3krAU
	 ftCz4Jij7q/zvnhSoXucwCSyBBdqLMIP4ISmQZKlBl03j6TlcXXZLVIfbcPzV8hrtt
	 phpHXhAbZQxcQ==
Date: Sun, 22 Nov 2026 18:48:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 06/11] dt-bindings: arm: qcom-soc: Extend pattern for
 Molokai
Message-ID: <20261122-dramatic-horned-coati-feeb38@quoll>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
 <20261120-molokai-soc-v3-6-403d763685d9@yahoo.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120-molokai-soc-v3-6-403d763685d9@yahoo.com>

On Fri, Nov 20, 2026 at 09:23:08PM +0530, Venkat Yadlapati wrote:
> Add the Molokai (SM8845) codename to the patterns of SoC compatibles.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

