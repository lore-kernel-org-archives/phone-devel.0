Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8633B8D7B;
	Thu, 19 Mar 2026 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911355; cv=none; b=ZOAWRKpUVRdDXVqAEM1xph7SGIJtbzThwgPRvb6IksfQ++nIT4UdgEmQUOz071BmqEp9nMM2TFxupBOQy03OnnlV40piEyl1WXOLmA8LuOGr7ZpY4fhziC0mgzMkV7vfWJxaX2Nq5WDbUouTTEH8/PFQVVvdzVHmwROKkdj2V0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911355; c=relaxed/simple;
	bh=5fTdycH5VKTSl4J376j0I5Ed+rPRK+nrNrd6HDt7DFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/lrZsasfvYw5kAyw+sqr7CDvk/s+7jz1YUBJYRa7e0i88g9GSmrYo9DpbRwBPetfWvHn2flYzkdaxtQ4o6ud2cP4+uOQL9TXs+URqY8cvpNrbKKLs7MylVx0sOMIMdfs7P6QkGOdNorTjrakqUYPW555VZtxJ0SLU3RSKsV7dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWiIl/PO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWiIl/PO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE707C2BC87;
	Thu, 19 Mar 2026 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773911355;
	bh=5fTdycH5VKTSl4J376j0I5Ed+rPRK+nrNrd6HDt7DFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWiIl/POzZoUbobwe0Pie6mk6kRAFA2FwhPIbxOoTtufktkFrweuwu6XM5HD/t7R5
	 0g4l7hos+hr95QAIpmt+WNGt47xvosBvKKKT77lv/6bqzoAvAcCwJknuCHA3au6sZh
	 yqUa1HkSrW31JDGcSCAeQw5wbXcUu/YRJ+F1jrvmJCKdf3gUg0mNlqiRuFKn4PYnk+
	 g1EghhA2XK5TyCepOrFFFk5TVyC/sHxDZDrR6rFZiZoZgzB+Ttlv8bfqRqfACnUuo0
	 zrDvFDbOOvmXOXsk01SwP/ZbKY7VzeveQyq8zmQRASNC9tDeOcfKNfMJwUbDqV5kmb
	 H292zpKqgAd/Q==
Date: Thu, 19 Mar 2026 10:09:12 +0100
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
Subject: Re: [PATCH v2 1/6] dt-bindings: display: panel: Add Novatek NT35532
 LCD DSI
Message-ID: <20260319-amorphous-pastoral-turtle-851af9@quoll>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
 <20260318-rimob-new-features-v2-1-c1bf8917449e@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318-rimob-new-features-v2-1-c1bf8917449e@protonmail.com>

On Wed, Mar 18, 2026 at 11:28:09PM +0100, Cristian Cozzolino wrote:
> +  avdd-supply:
> +    description: positive boost supply regulator
> +
> +  avee-supply:
> +    description: negative boost supply regulator
> +
> +  vci-supply:
> +    description: regulator that supplies the analog voltage
> +
> +  vddam-supply:
> +    description: power supply for MIPI interface
> +
> +  vddi-supply:
> +    description: regulator that supplies the I/O voltage
> +
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - avdd-supply
> +  - avee-supply
> +  - vci-supply

Only VDDI is required according to datasheet (see page 11 and page 16).
Others are needed only in specific configurations, which I would ignore
for the simplicity of the binding. Drop these three.

Previous discussion point was about this - write bindings based on
datasheet, since it is available.


> +  - vddi-supply
> +  - port
> +
> +additionalProperties: false

Best regards,
Krzysztof

