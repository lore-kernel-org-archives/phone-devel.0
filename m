Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03C207A20;
	Fri,  6 Mar 2026 00:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757050; cv=none; b=MnyXgkvDHr9GFrIl8k6kanMM6GUc7/717OUW8vgM4Q/zGfa7QOskVbzo7sZqJn3dmFTDLUUlWMD3hG49irb+5QOctKIPY6kfib5voDkhWP8PsGxkDoNB5LqHkQa6IE7HvQIqB8F3AtwC8TDvGAqYpKxoZtQ/w5QZexCJb6scrp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757050; c=relaxed/simple;
	bh=WYC43A9b8jtbhNz0YoSbpf+q8HxUhCunA8YjhxxW6TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bV0zeiY6i/cFkvyi+kYxrxDE1XO529anBHs+AQSEm7QIg3FpIsrhru73Av313uQDhmgFJjV5IaDfc76NVBcCRrJ54giC1e6eA+j9HXCWE61yGN4+SwWm7JTeopP7Iecs/tKZSpKQcyRU6Jtz3RdjOQKb05KnFu19/mpHPrKbR+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+bVQ9HN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+bVQ9HN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CFDC116C6;
	Fri,  6 Mar 2026 00:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772757049;
	bh=WYC43A9b8jtbhNz0YoSbpf+q8HxUhCunA8YjhxxW6TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+bVQ9HNy3bJJMH6OOsFhTIdVCYRt7YTLgMeT6Ng3Cc7h1mOvk5E1RcbPfEzEHNJH
	 RAaaqpYlGYft4cbL+RVfwXe6nUBhjAeM8JSLA/Eh6dCbC1BSSfVs63LNTHKCcRaYqM
	 iIboV+p03pVoKrpx5WSL+nedC6gqs1DXpjGo0nIvNQ51NN6YF1hd1pfOX60siTj97Q
	 4/smsA3WEkrSrzrP0ggznZPovsRNT1MDyltAaOgC2jJkpS9mxecQ/WbAMVZwx6jyz4
	 ZB6BbA7g4F1nocjsK74tVkHJprIxay3nVbe61PaNKYKdfym1pYBZZBF0PLWVgg1GbS
	 1bzf05eB8+Flw==
Date: Thu, 5 Mar 2026 18:30:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
Cc: phone-devel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Max McNamee <maxmcnamee@proton.me>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>,
	~postmarketos/upstreaming@lists.sr.ht,
	Raymond Hackley <raymondhackley@protonmail.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: qcom: Document samsung,coreprimeltevzw
Message-ID: <177275704847.856406.11424137082390066913.robh@kernel.org>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
 <20260223220514.2556033-3-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223220514.2556033-3-wonderfulshrinemaidenofparadise@postmarketos.org>


On Mon, 23 Feb 2026 22:05:13 +0000, Raymond Hackley wrote:
> From: Raymond Hackley <raymondhackley@protonmail.com>
> 
> Document the new samsung,coreprimeltevzw device tree bindings used in
> msm8916-samsung-coreprimeltevzw.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

