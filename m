Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A3E390231;
	Fri, 10 Apr 2026 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827653; cv=none; b=MRNwtYm+McndhUEHmk732oTiNOU3cY9ZmI9oYSY6vAmPVWtLSytBRIR1PwMdhlNHlVikMpbuovUgOyu01/6X6iO0B5J27tc0hSid7SK0Ba66jJu1naTmo+f6RXlE/Silt02a3WU0M4zSoXupDMjjFPpJrbVXWuTRrospWrQ+Z+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827653; c=relaxed/simple;
	bh=O+PLr5tYJFjlOU/vYSNSO13DG+GfWhz3Q71wmBZNamo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Le0cZKf927qZOt0VfqkadplG9tho6ZvA8wzNezeNDs26kROUYK4XZJaJbPVgM8i+MK9Zk5pJC+RPqErI7D5VodfnzC3c5rOtS/qIXlCzPmfVpWo7nZFuY1WjENo/xKsZswiYZACgHpV8tvUSxHBJ/XmKCiHQYKP9Ck3EJHnybDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yx87XWUI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yx87XWUI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3062AC19421;
	Fri, 10 Apr 2026 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775827653;
	bh=O+PLr5tYJFjlOU/vYSNSO13DG+GfWhz3Q71wmBZNamo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yx87XWUIMyy0WX88yUR4U5+g+glqNsKenI6T+o2+k1gidN27Z/5310yB/orhH05EP
	 L998kybYQ3uvebi9rrzaTfo3db1xQ5m5KNbQTGozJpTgb/Gfd89XxQK4B/0isdYzPF
	 mOOv1GJVI9ad5R/JpDPnerPykZvkrZCAR5i7kcSKURSAFCDIeBc0X6AZYaWl1l4Giy
	 zKfNpbRiXrrmASZqmNV+oQXc5y/9K+qeJZGoE7EUt9/D2X0iChzPWMjMUgyUd+s1AQ
	 M/tkYrjGh/gbWUcoTKrH3JOzTWPbKt3wC2KsH2TbD8k6KvW8GQfDbgb5maJmmKV1eY
	 wB4oOEuetwTXw==
Date: Fri, 10 Apr 2026 08:27:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/2] dt-bindings: sram: Document qcom,milos-imem
Message-ID: <177582764925.441661.4323143601044763082.robh@kernel.org>
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
 <20260410-milos-imem-v3-1-d215385fa5ab@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-milos-imem-v3-1-d215385fa5ab@fairphone.com>


On Fri, 10 Apr 2026 09:31:06 +0200, Luca Weiss wrote:
> Add compatible for Milos SoC IMEM.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

