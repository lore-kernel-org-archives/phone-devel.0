Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5AB3B0598;
	Mon, 10 Aug 2026 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354713; cv=none; b=blWsF1Y99tNhEF1Ht9H3Rsiq/feqazQY3XlJejzw3u8OKZm5hpjuCFe/Ctn8jvUYuVz1VVOx9ATm1tqxayANYd7jotvaf83bGqtJAxLC+6r/Rg0cgnJNN11vWfKXY/ahdv7pYr1CRAFx22Nq2ah/TU+EMrs8oQpMbgtOBaE//aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354713; c=relaxed/simple;
	bh=h0yIhrerMJAiuFRsy++PNeEJXVg6iydzgDzRGIswKfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IediiEs6e9mmePtqlkvyyn92NAdKMTOigC6EJnwOMLwg5ZVRI5dwrDsqe7diBHoVXu+anxK4RPHx7aOwa9DIQh8/If5kb7GJaVhjGQFOKf4Fmkh3B+1kjtJzzfl7IH1fbF/jx2hSFL0szUWYFPqc5U14yQyMXKMRZCIFO5QK/5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=necaQJAs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="necaQJAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786354712; x=1817890712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h0yIhrerMJAiuFRsy++PNeEJXVg6iydzgDzRGIswKfs=;
  b=necaQJAsuMaZ0DZYB8b68P3aDQE85J+mjjNvK1FuSOpyWabrOwO65HMI
   kaGBIgHzZzqACFE6oMKdKQy5/ika7AzA5Gc5ubh0vGgdcwiBLNX+DTFOD
   6S//2Ff0+YnPHq85+MwdvkVXporr4/lIy6ALCG+iUwXYuV2BGAqNZDU7n
   2DHLKYBLEtfFp1UeKfNGF1fmlEtuxokHXgvmnD3YHGvHBI8v5cvXnOdvK
   IGTj3gzOLMZyWBcT8h0q8CwCyvuROBg1QQGx0xBm1kKt3uJkraSpfOSYS
   9X2vRwE+5XuQa57RmJbMbDF0Q5Pmae5fQNOHruheJR8fjRWBXc7+Azo3y
   Q==;
X-CSE-ConnectionGUID: ZDZJ5DbHS9CIBuNRN02edg==
X-CSE-MsgGUID: t1cI63o6RMy1CI5x1kuJKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="98015041"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="98015041"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 02:38:31 -0700
X-CSE-ConnectionGUID: sf8saDVWRmiZMFEJMCI6GQ==
X-CSE-MsgGUID: 4EKwvLwxSQyiJHpE4KQauQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="263040797"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.127])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 02:38:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 942B6121197;
	Mon, 10 Aug 2026 12:38:26 +0300 (EEST)
Date: Mon, 10 Aug 2026 12:38:26 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: david@ixit.cz
Cc: Alexander Martinz <amartinz@shiftphones.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: dongwoon,dw9714:
 Document DW9714A and V variant
Message-ID: <anmcEvEwld-ZV9WE@kekkonen.localdomain>
References: <20260803-dw9714v-v3-0-8e10278dcd0d@ixit.cz>
 <20260803-dw9714v-v3-1-8e10278dcd0d@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-dw9714v-v3-1-8e10278dcd0d@ixit.cz>

Hi David,

On Mon, Aug 03, 2026 at 11:50:25AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> DW9714A is successor of DW9714 and DW9714V is successor of the DW9714A.
> 
> All actuators are backward compatible, but they do introduce new features,
> such as Smart Actuator Control (SAC) mode which can minimize the
> mechanical vibration and achieve very fast mechanical settling time.
> Support for SAC can be implemented in the future.

What kind of configuration does SAC require? Such things generally aren't
configured from the userspace, compare e.g. with the dw9719 bindings
discussion.

> 
> Nit: fix typo in description by removing duplicate information.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/media/i2c/dongwoon,dw9714.yaml     | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
> index 66229a3dc05d6..7c2769e6c4880 100644
> --- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
> @@ -5,22 +5,30 @@ $id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9714.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Dongwoon Anatech DW9714 camera voice coil lens driver
>  
>  maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
>  
>  description:
> -  DW9174 is a 10-bit DAC with current sink capability. It is intended for
> -  driving voice coil lenses in camera modules.
> +  10-bit DAC with current sink capability. It is intended for driving
> +  voice coil lenses in camera modules.
>  
>  properties:
>    compatible:
> -    const: dongwoon,dw9714
> +    oneOf:
> +      - items:
> +          - const: dongwoon,dw9714v
> +          - const: dongwoon,dw9714a
> +          - const: dongwoon,dw9714
> +      - items:
> +          - const: dongwoon,dw9714a
> +          - const: dongwoon,dw9714
> +      - const: dongwoon,dw9714
>  
>    reg:
>      maxItems: 1
>  
>    powerdown-gpios:
>      description:
>        XSD pin for shutdown (active low)
>  
> 

-- 
Regards,

Sakari Ailus
