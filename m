Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6714D3385A7;
	Thu, 30 Jul 2026 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402133; cv=none; b=gyg0xZYseWm5TJgeXTvalYsp+IgndYWh4hsVKhAb2CbESEjlOYMPI02j1nqUkLBBoXhc4nt0Ug5TQUKlKH3kKvH3zt4qiuNBGCi7oUFy/zesMvo8lMYXJyl7tG0zhbI9WnHqCdConY7Pci2zFFuZ5uRFJXh/5QOLwM3oYBV7+Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402133; c=relaxed/simple;
	bh=A6txrsyPImt8R9z1kB39pwqOR3g0yGHEel1krXgyZYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhIDKgYn1E4fUj7429kG5PYKS4bZuAeRaofD2bJf8GEJ6r+oX3mVqgHo99/bRafurzRrEzuvVRKPkpiqfXLQqz6UwJ29kjWm0IFd0c1AitjXkbqt0rc7Cq4Mmb3P3XBL0veyUTGSn+Bptt2vqvFNR1ZzfpHQnZFZ01g5SDX2M4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwH6vYuf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwH6vYuf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296581F000E9;
	Thu, 30 Jul 2026 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785402132;
	bh=itMz1KoTRX2J7guxWgv1lzWWwmKqNFtI02j4zxcMdQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cwH6vYufkEHaKzhRcKgnqL+CBA56qc7IPsEvJ/Wy6A7veUBlSkFU63IXIyd4H8raz
	 QgBZ9ZYeLnp/nDOEOjOYjbCXquTAOvDkjTLl1m0nnVfnzF4wczm0WD/y9TVzvlugv+
	 n9+vyM8ZVir+Qv/ubspMMcZsQmjkcs9KZL2f6F1DIHWvrmVLit0p+JliLA2h0YBcer
	 ZmasPcqznR4heeB5Y/7SIPsvP5uoe5vjSxfB9O9JX+qaf7X7IFww2Rei3KM/7izWCp
	 wmgv7BV7HjasU9WKF3TVKJar9MURz0T9ByaBv1CGw2cwSvvBu+qW2L52umowOXPeUW
	 G836xzzVg0j/Q==
Date: Thu, 30 Jul 2026 11:02:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: Add compatible
 string for SM8475
Message-ID: <20260730-peculiar-bug-of-elevation-1f7f09@quoll>
References: <20260729-sm8475-asoc-v1-0-3edad8aa7628@proton.me>
 <20260729-sm8475-asoc-v1-1-3edad8aa7628@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729-sm8475-asoc-v1-1-3edad8aa7628@proton.me>

On Wed, Jul 29, 2026 at 03:31:54PM -0400, Esteban Urrutia wrote:
> Add compatible string for the sound card found in the SM8475 SoC.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

