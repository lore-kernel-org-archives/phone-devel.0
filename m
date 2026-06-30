Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C7C3B9D84;
	Tue, 30 Jun 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836595; cv=none; b=I4luzN0eDYziqXrMiHftVK9uoCcYsMp2rNYqMiPUDG5zYbmmg9oz6AUhvJJlM5ezx31/9UzB/Rv4shrRQ/wm8cFGEc7MfEBeSdPmWAR2LO8OnbhEN6udlVzB8d804dgg6DNGG+tQFTkOJb/e5S3ciphvkGtxyhL0tdcwQcFWG7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836595; c=relaxed/simple;
	bh=KhkxMedQQRIcfwWXYlMxNfQJ2Izk6ZD+3c/eD9pgzWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUD5hWLkijXJINmj76FCTTw19ISKZpVzKoR2ti2Lc+E7/EbyAl1Dh3iBCf1EJI+Xa8cH9pamwCgH6GJV+i0pw0Rds2rFmlH8wEpSnQ1pOlaL2XdBPhBxvuB2XZMKDSfGFfiCuk9jXHOo6x3bvGcSNqNiw0MFc31r0KzL8Vs+Mgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNfllhvJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNfllhvJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578711F000E9;
	Tue, 30 Jun 2026 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836594;
	bh=+aWdnoMMtLoLPwWqfxE5l3Mi7c2BQoVXxXHwRngYLxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JNfllhvJO5N5wVksTw9WwBnKjPMOZJR9RPF/WorjJxlD8KUYbkA4Q4dSG2pA/I73v
	 gsXcWinbucwHVI7odj5o3AyzaWa/BqtUnNrimAB0mBaQ2a2LiKDQdW/NAPLFHe6nlb
	 plldkahii6Oq62o/LzINmEQidRkhIVLWD06xYCBlJRxpkzt/f9XEF54F7EqSi1Njsq
	 7Tocnxzk0anOnFEcNOFGVQsiL6nY5DBDwAojIJF4wiRJt3B3veBixbNcSzi0SVuNEb
	 G5UOS23xJsTx3LPgWzSSv3Mf8adTLtbKDZEWHFlWBlLKQg8KLa06RLHv37U43Ps/0+
	 xm/DekhQ25N+A==
Date: Tue, 30 Jun 2026 11:23:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: devicetree@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
	phone-devel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, patches@opensource.cirrus.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	David Rhodes <David.Rhodes@cirrus.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: Convert cirrus,cs35l36 to DT schema
Message-ID: <178283659300.3869832.12251843257328309264.robh@kernel.org>
References: <20260624-dt-cirrus-cs35l36-v3-1-ec451d5a2908@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-dt-cirrus-cs35l36-v3-1-ec451d5a2908@ixit.cz>


On Wed, 24 Jun 2026 23:10:02 +0200, David Heidelberg wrote:
> Convert CS35L36 Speaker Amplifier to yaml.
> 
> Changes:
>  - maintainers email to the generic Cirrus email
>  - Both the codec and downstream worked just fine without
>    VP-supply provided. Align with datasheet for similar models.
>  - add dai-common.yaml to cover for '#sound-dai-cells',
>    'sound-name-prefix'
>  - updated not yet implemented:
>      cirrus,weak-fet-delay -> cirrus,classh-wk-fet-delay-ms
>        (in both definition and example)
>      cirrus,weak-fet-thld -> cirrus,weak-fet-thld-millivolt
>        (only in the example)
>  - added two required properties:
>      cirrus,boost-ctl-millivolt
>      cirrus,boost-peak-milliamp
> 
> Assisted-by: OpenAI:gpt-4
> Reviewed-by: David Rhodes <David.Rhodes@cirrus.com>
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Relevant for Pixel 3 / 3XL / 4.
> ---
> Changes in v3:
> - Corrected properties which has been unimplemented and also
>   conflicting between definition and the sample.
> - Removed units from description where units are part of the property
>   name.
> - Added sound into the $id path. (Mark)
> - Readded James and removed Bjorn. (Rob)
> - Made path to dai-common shorter.
> - Added two required properties
>   cirrus,boost-ctl-millivolt and cirrus,boost-peak-milliamp.
> - Use $defs for the cirrus,vpbr-config to prevent matching it against
>   vendor defined properties. The driver is already mainlined with
>   cirrus, vendor part, so we have to keep it compatible.
> - Link to v2: https://lore.kernel.org/r/20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz
> 
> Changes in v2:
> - Rename the commit. (Mark)
> - Link to v1: https://lore.kernel.org/r/20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz
> ---
>  .../devicetree/bindings/sound/cirrus,cs35l36.yaml  | 240 +++++++++++++++++++++
>  .../devicetree/bindings/sound/cs35l36.txt          | 168 ---------------
>  2 files changed, 240 insertions(+), 168 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

