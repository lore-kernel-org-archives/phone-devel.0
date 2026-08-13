Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE9B351C2E;
	Thu, 13 Aug 2026 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608195; cv=none; b=owSsiq6rxK3CHgfm37wOazQP3cA1wAvcZhL/SF7Zu26oW6DnaCntGcXlPK/2vHtJLzhcclX21xb+t9RfHf0h/MlTzXbGCfUI1DP0MZBdmQf7+0gjuARCIH/Eh7YYqJRIwCPMw8HZgSDx00WdQr9jQRb5zrNAATWqLUKULhSv53w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608195; c=relaxed/simple;
	bh=kI/5LyW1Rtte1JM4ZASzKTXDg/Ray+3xpolMxboIV+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kd65vpsy0Ndmg3S+LbEk3kjTAfaSFZNYleV5WL1wq8RGfHRT1nlsjkcvLeFIv0g9PhFdyW3BsCnIqfVZQluJBgYBXztr8FhidNu0yQqiAbaVMqxssdyZGMQgUgXusqv1Of7WouX31/k/wAAY27ghET2oVfs5AyYOI6ARbpl5FmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmS7+fMV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmS7+fMV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B1E1F00A3A;
	Thu, 13 Aug 2026 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786608190;
	bh=Iz+7fETSbwxk9ayNUyshNIy8aC88+a5XyUeWOxqJ32c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jmS7+fMVZCpvHrkhQaY4In+DExrGR5g+1Et0SND7SJECykdUgC0uZMW6CYF07JxqU
	 PZ4mZK82nF9+tPMd5NDDMvLGF4xAl4NAVOuhfKjXSZ0h3q/tVq10nw+gK2p9cUmyZg
	 tqVM4hNp93spBCozscid0fY2lyXofaGtjogVKrqNvEAn2DdiK5Hrdz8fwlOzyvl774
	 wDPo66C48ovfnkL/1DyY9Us0zotP2B4fidVMbWsqkX6G7ouOqqvEYtDG4dV9jmFPv7
	 i/FtUXUIYU6ZG8FyfKryWuk+aCX+207T1lwZPD8c8YRGBQT844/O6Wr9Um22oh/dQF
	 ZXU/gQaxFo6SQ==
Date: Thu, 13 Aug 2026 10:03:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Parade PS5169 redriver
 bindings
Message-ID: <20260813-fortunate-gray-cockatrice-8b05ee@quoll>
References: <20260810-ps5169-bup-v3-0-a2178b2834d7@proton.me>
 <20260810-ps5169-bup-v3-1-a2178b2834d7@proton.me>
 <20260811-watchful-turaco-of-opportunity-b8ddbf@quoll>
 <5b70bc25-a255-4059-b020-da936e7432d5@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5b70bc25-a255-4059-b020-da936e7432d5@proton.me>

On Wed, Aug 12, 2026 at 05:30:46AM +0000, Esteban Urrutia wrote:
> On 8/11/26 5:11 AM, Krzysztof Kozlowski wrote:
> > On Mon, Aug 10, 2026 at 11:31:36PM -0400, Esteban Urrutia wrote:
> > 
> > A nit, subject: drop second/last, redundant "bindings". The
> > "dt-bindings" prefix is already stating that these are bindings.
> > See also:
> > https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
> Okay, will change that.
> 
> >> +
> >> +  parade,dp-eq-db:
> >> +    description:
> >> +      Equalization for DP channels.
> >> +      For example, <6 5> denotes an equalization of 6.5 dB.
> >> +    oneOf:
> >> +      - items:
> >> +          - enum: [ 2, 8, 10 ]
> >> +          - const: 0
> >> +      - items:
> >> +          - enum: [ 5, 6, 7, 8, 9 ]
> >> +          - const: 5
> > 
> > Eh, this is on me. I did not pay attention that values are fractional.
> > You should not be a list, but expressed as a single value, which is not
> > possible with int32. This might be the only ever practical use of mB :),
> > but I doubt that any engineer would find that readable, so let's go to
> > your previous code - direct register values - for all three properties.
> 
> -db$ specifies an int32-array type so it should allow for a list.
> So I'm not certain what you mean.

List means two separate values, not integer and decimal part.

Best regards,
Krzysztof

