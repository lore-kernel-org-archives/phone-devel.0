Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF7F30B51A;
	Wed, 26 Nov 2025 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764180663; cv=none; b=MxrsQk2enLccjITP1ObAcMuwiVRDl78yp4LfvQgNSmXQeL83jMIbXmSYhXE3h9kLKhA2OnmebYNnyoshz+Hgi8DZBYjeU95ujCIiZDOwepSnA2i09BKHcINtCAc6ZDhqYiuS5C1wN7TuAKB5Ln3OKCXJ4GldUc/CEBsTEa172Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764180663; c=relaxed/simple;
	bh=icStHp6jzP9XcTYzSQTkyIf3tCmEj269ihIOEprRDKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlt6BAJRloZEWCIaYsXGpyksd3iZOFVGR4CL1JEJLjOt5YB88Mbct2dBG2yON7B7amkYuLa58IpUOAwZQ3cerI9TzymofMYolUYcWaMWcag3BFOlwDjr7seQ0w+U+75dJBG+CeqCt+5enKYN3TBWSEUGxRRmVLW2/BodwrexhoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E25168F;
	Wed, 26 Nov 2025 10:10:52 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 569CC3F73B;
	Wed, 26 Nov 2025 10:10:58 -0800 (PST)
Date: Wed, 26 Nov 2025 18:10:55 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, Will Deacon <will@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Casey Connolly <casey@connolly.tech>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Alexander Martinz <amartinz@shiftphones.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Pablo Correa =?iso-8859-1?Q?G=F3mez?= <ablocorrea@hotmail.com>,
	Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH QUESTION] arm64: configs: Add Snapdragon 845 config
 fragment
Message-ID: <aSdCryMAOb7Qk-qq@arm.com>
References: <20251126-sdm845-config-question-v1-1-ffa91ed53095@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sdm845-config-question-v1-1-ffa91ed53095@ixit.cz>

On Wed, Nov 26, 2025 at 05:19:20PM +0100, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> This fragment provides reasonable default for the mobile devices
> based on Snapdragon 845 architecture. While default config could be
> used, the reality is it brings many issues to the development workflows,
> which are much harder to address than on generic boards or devices with
> available UART console.
> 
> This config fragment produces the .config used by distributions.
> It is designed to be fairly minimal and specific to the
> supported SDM845 devices whilst offering all the features you would
> expect.
> 
> It disables other arm64 architectures to speed up build times and
> decrease the size of the kernel image.
> 
> To generate a .config use "make defconfig sdm845.config"
> 
> [David]
>  - Dropped distribution specific options.
>  - Added entry into the MAINTAINERS file.
[...]
>  MAINTAINERS                      |    5 +
>  arch/arm64/configs/sdm845.config | 1048 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 1053 insertions(+)

I really don't think the kernel should carry configs other than the
generic ones used by developers. We had this on arm32 but mostly because
we didn't have a single kernel image for a long time (and when we got
it, it was mostly for v7 cores). I don't want to get back to hosting a
multitude of configs in mainline.

-- 
Catalin
