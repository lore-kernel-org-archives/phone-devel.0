Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C7C3D9680;
	Mon,  3 Aug 2026 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748902; cv=none; b=mwI0y/n0BUhLYR7icV4OhSIu0ceYoSZdba7XfhdSSdiEmx+fxDc7hkvEVoLmCABMhI2MQDzVzGKyyb8AFYvdzaI8X23q5thf5TRAD6O0QBfyYG6pVzc0rshda0UrUiF1E2LmyijLCXOU8yG9IileVRugOhTKHfL4iJM3XdIvx30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748902; c=relaxed/simple;
	bh=9vwjQ+6IjSueeim9H2719MmP2VNUdp6T+HrwZK2paV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ET5NWim/PsdmCmBFULqe8bdX0YO/XxC7BEBUbOiqyzwUod9Qhv8yqmo5uYcDEqz4SIt54DxiJEAnp1VmRTpkbJmN4nZ3PwNfUkfbZMFuj3hRCZlzM7MHT1kV1c408n79cdHta+HjNbgzsTSo0drofAL/D6doRNTXIfL+ni6GKUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBSnfSmB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBSnfSmB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79E91F000E9;
	Mon,  3 Aug 2026 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785748900;
	bh=IIDXExp0sPfWWusIP+FZP8RihVviG7VQ9XWu3nvDOOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SBSnfSmBZcKeZOACe2xeRmoN0XyCzPk6aQTnG1c0pFRYLrQSKp14Crl6MSjq0y+qs
	 Bha84JSGBHbrjyXfL3+o8ad76XWn4G/3YSdADz9tKWftcQ4goyfBUtxKfMQWN1KrTi
	 vr8xqtBkxkAS1XS9NmuVl+CkqiRLWuiWJjblVvQGyHh2JT0fhfdtvhAcZKtrAaew8k
	 gGAz6QSYDvWuw0RDyFfcDTe8Hbvjp/uTi5swgvPmBTQ9u71KxWV6p8A1WjFa0XBEVQ
	 zcJkuQdEdFaN8ZoRenU+2uESEaaXXQdi2ZgZdIdephpK1qOOe4zLU4oJSRUAP1U0bF
	 3Qd9yfoK8KRUg==
Date: Mon, 3 Aug 2026 11:21:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Martinz <amartinz@shiftphones.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: dongwoon,dw9714:
 Document DW9714A and V variant
Message-ID: <20260803-brave-encouraging-anteater-4ffbd4@quoll>
References: <20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz>
 <20260730-dw9714v-v2-1-d5da19e6c60b@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730-dw9714v-v2-1-d5da19e6c60b@ixit.cz>

On Thu, Jul 30, 2026 at 12:20:12AM +0200, David Heidelberg wrote:
> DW9714A is successor of DW9714 and DW9714V is successor of the DW9714A.
> 
> All actuators are backward compatible, but they do introduce new features.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/media/i2c/dongwoon,dw9714.yaml         | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

