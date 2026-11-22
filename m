Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369687;
	b=bjd3Q3jk7ZKKw21Yks8ML2sKTmThq1gpQdSPgqBzh5xu/X/eXZbgoq1WdViYylkxwnb4
	 c4XtNhSl5MDe6CYGjW2h0p7VPN4YJbEZwy+b+bJK3Dytzkneqlt8I5WTVk15vCBQ0J+gr
	 FEgUdBYigSm25FokbV5CZod679sdN9FM4+IGx4RBQ0Q0CpJLGS92QGjpFLJOKYLmJ2WFR
	 DGuLOCQOTJLlpOnrmwk4Z8/IxI0uludA5SEFNskspqrkB10gdPp9FxSP7SfFhDaHE+wcY
	 Dx2JJtjdTdZQtZ7QY+Xpvb2JyUDbDavf28O6glkDxTf+YD1533Lz96SqJ4RK3Qa0ZdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369687;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sFhVQZt5qf+w1qf1nMt/dnDIo/UDfgjc63sRz0PaBJI=;
	b=BSJUTBoMaaybzKcmZLBySCgDfwviVT0OBm8E7x/8/r6qHDNsuYXggjYZTc93DP05GAWE
	 MyzpK2aUhUTDRBqCckImWBACJNWuKa7JgXhGUNhaeu0TwwmTdT1obQykeaumZmtbzVeQR
	 3Q7v4YTYV0cS6swO09YQfw5KknVUH5T8XXskaTJqoT7phN2+2JcbYoRIV/dm7k9dBgqd1
	 lx5aYKf3IIgZm9SoWBmZzaqKI09/b/E0eE9f3a+zJNXBdWSmd3x/aT+4T5oWUaZTXqoJV
	 bGuV6uRpA3OZcqN7PldPcJuhs1t40NrjHyhGU6svNiKv58fyNvuaI2hsGxhrMiGgjqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWjAQ3oV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB93606A333;
	Sun, 22 Nov 2026 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWjAQ3oV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0311F000C0;
	Sun, 22 Nov 2026 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795369687;
	bh=sFhVQZt5qf+w1qf1nMt/dnDIo/UDfgjc63sRz0PaBJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iWjAQ3oVT3EwtVA3vai2qyIxLRbuUnP+8Ax8TPNILeHapPA+TXL5fIcCYSnTw1iEX
	 pM61TQD/OCJM/VnRvy6WLEfMRrtGT5nZDYDy9XZfwEQn0FNO8D93gjRnUK3/QgJWfo
	 vRH7kUBQENjocga/6aXAJFtiHOWQcGLCqe6VqjjK754kKE5MEyh9yPm+QOisphVwpC
	 WwgE6AazGOhpc6tBN17If0ljMJvaHpZZTvJYLdqXCdMWUdLwNdZ+pO+67kK55Ga0ww
	 L1pcHOy5QR9hJObzrMbbVcHpz72NAVAey3IP7rcoOcEH/wi9HXT7X7hLHVmpSFq3fT
	 Khbuk5WuBG7YA==
Date: Sun, 22 Nov 2026 18:48:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 02/11] soc: qcom: socinfo: Add SM8845 SoC ID
Message-ID: <20261122-reasonable-tacky-pelican-ed7d06@quoll>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
 <20261120-molokai-soc-v3-2-403d763685d9@yahoo.com>
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
In-Reply-To: <20261120-molokai-soc-v3-2-403d763685d9@yahoo.com>

On Fri, Nov 20, 2026 at 09:23:04PM +0530, Venkat Yadlapati wrote:
> Add the SoC ID for SM8845, a variant of SM8850 (Kaanapali).
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

