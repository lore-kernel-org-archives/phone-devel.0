Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3151D353A60;
	Thu, 30 Jul 2026 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402207; cv=none; b=KBX47qDSFqiyH7NZGgUItRIDJpQJ3hoykYUrFx6AIf1GJT/3kGeYaHcoPxjipfxZruo4/OD2V9uAmaYRiPeBsGOu+Ezk36JlwGDTCXGnrm0O5G89349fDMufrAjMxYH3rzd9MaO/QuFnDZwkAM9h9gxt8Fp75+z8JRM5gRGoo7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402207; c=relaxed/simple;
	bh=Yi9rHiqXfSpsfsjAF1ysvNfameWpc5agZJadGPKN/IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xcrp0wITNlMRSIgQTYydiyYWF6849FJYx4DTe/yCZD8ovekhHJ1/QKQCKEK6fbb99m6L2Ld6zvtL0LJRlUXmAu4+qA9nG3dSGmfOkR0rlsQi/Oa+SXfG95XJiZMbaaDgAwaFsWpla92+j01x39AjNkxAVr90C633HyAFwiua6ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=af0uzbJz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="af0uzbJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9E01F000E9;
	Thu, 30 Jul 2026 09:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785402206;
	bh=Yi9rHiqXfSpsfsjAF1ysvNfameWpc5agZJadGPKN/IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=af0uzbJzYKPKjbuXxyWbneK9wzLW4A7w+T+evMdPT9Iod52eZY314U34p1sGYxeK9
	 rr24mlLe/wmD8WoVvMIfbkKP8mSvjSSJMRXeOZmkp9geoCb+EJz++OjLRepN2fybio
	 WRBMe9s45ZfrO+5ZLiyy91hkl6rpCVESF/ISe5n4cjqxBU3DLZoZmktZkHGtTs9GXD
	 uVQzLhtiifxmmehW3oQ8OYRhlOxPwWpGNktDZqZUl8In8osq4CFu30DDRYCGWks6QP
	 lo7hEz4sAedVl5rqX1h4hYCY7h4FsCLj2Mm2ZpTIoo++6b+JdAexOLxzppbKPdZk5o
	 lR9gWGxdrFDBA==
Date: Thu, 30 Jul 2026 11:03:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 compatible string for SM8475
Message-ID: <20260730-resourceful-scrupulous-goshawk-c9ea53@quoll>
References: <20260729-sm8475-pmic-glink-v1-0-c2e1967c04de@proton.me>
 <20260729-sm8475-pmic-glink-v1-1-c2e1967c04de@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729-sm8475-pmic-glink-v1-1-c2e1967c04de@proton.me>

On Wed, Jul 29, 2026 at 03:48:24PM -0400, Esteban Urrutia wrote:
> Add compatible string for pmic-glink.

First, not true. You did not add compatible for pmic-glink.

Second, that's redundant. You just repeated subject and the diff
(although incorrectly). Explain why this is not compatible with existing
variants, writing bindings EXPLICITLY ask for that.


Best regards,
Krzysztof

