Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2203E6391;
	Wed, 18 Mar 2026 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841878; cv=none; b=WhnGqP8OokQHt13sudRVtK3Jq7tcy8cS4e9a/EcdBNXnrzk1PbWX7cYSnT5D3nkZBGBzWLlpHe2G6C5MiVB2ih/HRyppcC+LQfg4NQwAgVM5CIYgedMyFPpgfnJ3aJzJRmljYfe8uwbiBKrV8YK5l/LNi0FHc3XfNbezVaTARcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841878; c=relaxed/simple;
	bh=NgFCyD93QvS9tG8glqI7VKoCbWTimTFIPCfv75Xlqno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/pS8gDD6QTzTt4wbiJoqwkpXyh6r3L94AsszBhlcWwtPwUoeGr8/Yk2rsEZ+IMoNyUjFm6ueAOmG8pPxElsrtOoyz/4Zw59wrTYu649HV5BQ4m+JQEI8yQXIM8dKTcUgts457ZCPxC23C8lgwHxk610TCJrxrGhIhOBVOmDFUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UaRUdEM0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UaRUdEM0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A17C19421;
	Wed, 18 Mar 2026 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841878;
	bh=NgFCyD93QvS9tG8glqI7VKoCbWTimTFIPCfv75Xlqno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UaRUdEM0hsIdzbAFTG9bUP+ysTjC87okAfIm54VBqZ37M3gAmNqyTv3+5An7lJEiU
	 W0IV6wSwb37Try7iAAYsic5FZ1Meh/IIi/zk7HzrU5suAbgcxA9Q7MRpx1sNqGD55w
	 yHRM2U4Od1fJWbB24ghxb+BUJf8KbqKXIKVLe7MK3JZMkfFI0vWutT0w9eF3My3k1w
	 8P9c76aAZgFjA/bmGYRtV9Ux8516rO03gLa3xEDRpR2UxaL+EhVS4tm1LlMB3giSzs
	 DmI/zBSzizco+8Egd3UY+7pQeVWTgnMs+S+py697IcrAJ2Ue48jge5vuGh4mWZOdBO
	 VvcItUQY6/V1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add ambient light and proximity sensor
Date: Wed, 18 Mar 2026 08:50:29 -0500
Message-ID: <177384182918.14526.1161243063385825907.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225-z00t-capella-sensor-v1-1-99f767bc326a@gmail.com>
References: <20260225-z00t-capella-sensor-v1-1-99f767bc326a@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Feb 2026 16:43:24 +0200, Erikas Bitovtas wrote:
> This device uses Capella CM36686 as its ambient light and proximity
> sensor. It is fully compatible with Vishay VCNL4040. Downstream device
> tree reports Capella CM36283, but upon probe, a device ID for CM36686 is
> actually found. This commit adds support for Capella CM36686 ambient
> light and proximity sensor.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8939-asus-z00t: add ambient light and proximity sensor
      commit: 83a06a3afb36818f09d68490d5939e7e56cb96d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
