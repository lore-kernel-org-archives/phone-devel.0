Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA90733A716;
	Sun,  5 Apr 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775375729; cv=none; b=WoW1Ruj4GEzbUodyp/zQxvnbBZJvzizDqW9IZG2DW18AKfpMlQML3XY/wtdTeyQdfdBa5gCdBtouYbNEo1WoLCW77bIuquJHNoSeL2eik4Sb9qR5UP7l43y2eh4omVLtXguXbibRqxQCeH14AAXwfIqgD5ZwJR8xWu2XbgdCnaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775375729; c=relaxed/simple;
	bh=Nj33knzFJ8xhb2ItHkZFFYsvHxXYDRfevSi7RRN6bTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0sC/apgBl9UtdK6HetKL1UqhKa6EPNtfely/EPI6kB6hnyjZc2xIq13MIWuA9E6wixtnY0W5hpcOVSa83BTC54iGIQkTUCHwoRKB7J+aJJObb4pAIoKQ8kjTu9Fi+tGE5Zjf2Vib0YYOuAd46s549ZPv3UhsKizmX5sDOWhu2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b16cKHj1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b16cKHj1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AA5C116C6;
	Sun,  5 Apr 2026 07:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775375729;
	bh=Nj33knzFJ8xhb2ItHkZFFYsvHxXYDRfevSi7RRN6bTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b16cKHj1GxUcOvX3Q38JEcWoO0LythOOs5XOgalA27mb1dlYkNNw36LbEFkXdP2/1
	 YHncm42fsyDtaXvXAt9Cqifbb4OHCpfUxxua1GrYv2jwIQhcpd3fzwmjv7lqI3N/m8
	 /WYNUvPlXAVEllBIrMdpDhLdsukDTnfKn++WptENAs2pvjWx43CU6R0f/ECcC2ztjG
	 MBWcdbs+3nuI85FYWw58YCxFfhNqdrqN//EAX4c0mPkoIj9DlO0X4wmsxJ4GwSdMrC
	 MdNcrG/rekQytLQHAQMRpJUHkI941vFnq6sc9+rGd34O+lEA7hZDyyz7ZzD2GjGZlR
	 pwlbpNbqQoZIA==
Date: Sun, 5 Apr 2026 09:55:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Casey Connolly <casey.connolly@linaro.org>, 
	Joel Selvaraj <joelselvaraj.oss@gmail.com>, Jens Reidel <adrian@travitia.xyz>, 
	Petr Hodina <petr.hodina@protonmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Poco F1 Tianma
 variant bindings
Message-ID: <20260405-truthful-fat-angelfish-ec3e45@quoll>
References: <20260403-beryllium-compat-string-v1-0-0a6b9cb55a20@ixit.cz>
 <20260403-beryllium-compat-string-v1-1-0a6b9cb55a20@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-beryllium-compat-string-v1-1-0a6b9cb55a20@ixit.cz>

On Fri, Apr 03, 2026 at 06:55:33PM +0200, David Heidelberg wrote:
> Add documentation for Tianma display and touchscreen variant.
> 
> While at it, correct binding documentation expectation.

What expectation? What exactly did you corrected that you claim this is
a fix?

> 
> Fixes: 341fdef8ea49 ("dt-bindings: arm: qcom: Add Xiaomi Poco F1 EBBG variant bindings")


Best regards,
Krzysztof

