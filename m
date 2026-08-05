Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF26306756
	for <phone-devel@vger.kernel.org>; Wed,  5 Aug 2026 05:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785907312; cv=none; b=KYkalyoGDliuhuDoJ04I7W+T+rZtq9PLRkrxhpNqJOg0r4T4m9GW3O0MF5tfA3flQY+w677yX9LgxogmRpTm7agOMJZ6yZ92aV8/UEHpVJQGB9hcq2qChwEi+7FaVdIylLzSBEpCgendIY+wK1c/zUaX6/RpT3wTcb/w3a9cVXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785907312; c=relaxed/simple;
	bh=5BLN84UWE5aL8KC1TYqhaAbXFpJ/PAqioCsYhC1X1W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t84aI+WrcoSRKUeVH6n9AjVdXHpdtKjwA/cSmEu2eaIoZc3Ga1MHCTPNQPgGCYtvwPnvmG19OS3IgyuUme4nc9zPXS50I67ywjteT4x1e8dAM3dNj12085UgqKwLrNAUE1Fn1O0uO5N5YksdPeRwsxsiZu5vKeldD1VcH+fuwrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQjcMoUu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQjcMoUu"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d01663d816so5375965ad.1
        for <phone-devel@vger.kernel.org>; Tue, 04 Aug 2026 22:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785907311; x=1786512111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+SgxE3ywvb4IGbVXZDenqphK+NGLI4pTkX6+69jjI4=;
        b=eQjcMoUu6Gvpw3aPUaZ7wem7oApGlpwev81IBut9BGbx2VImjl0mVUZaWXuX96JbIZ
         TZ3DQZ3BUAlfGl6sHD+qUwHCjk2lxFhoa7M1c29SBXYPIDStQF30s4DrbRwfSRiuBHg1
         cYtS6dpiGnj1AID3q6mHR+O5J2zPqNgc3pDCeHflUf1VTfzCNZkmJxmfo7PEF+81OfBe
         TF6ZLC3BWLzcLOSq3VU3iiOEeI0vEZN8hUHGlbnzN0FEt9sn/jF/arvOu0rdJpdvExSv
         CxG3fxB4HnzXy3yE6XPnF7kHKW4eQ/ealNFXd3XXXNSOOpcVwSBGKr9t/jIPz6OVsNE+
         Nfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785907311; x=1786512111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+SgxE3ywvb4IGbVXZDenqphK+NGLI4pTkX6+69jjI4=;
        b=gL38rpxUbcUPNk++CGX4q7oVvETe0tjlQrlLan5BUi0ekt5y+F/pMQFBn7PsEOhil6
         4MCpA+6T+GAwnWr7Mw4fQ3DsGN04R2SuivGnuugTWAgnq2kZFZfTGeXCwcEisD0bxwJi
         MHDwWvslAGMPgv71HN5e+T0aomaS/fxboI4ZqAbDs089/UCBvPmd684TXj0RpkOr1eD6
         qQ0GE8IxLxKslFLKq0gqUQEspujGO+tloy39BQrTl5VlH0AtLn0RpC5qXX/gcn6644AP
         b1wqnwqQYrlUbFeChpAypCp6M/aVCoIEYhGbq7z7OGRVw704fiXmQahx02y5oaKfWLuo
         9kWA==
X-Forwarded-Encrypted: i=1; AHgh+RqqNP1VlWrpLriNM8I+HPVaJGTcq0wB6HcRlw973/+gnfNk1dUN7sEYLy8qcRuHOnxeJVhazATDuhWoGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6BPiqw1mMU2NFnvhgtMueghWxSY6drDmy17z7MP1MKkYW+bf
	Ei3p7QVzY9mI9ifgPBXOny8cUezywOzl3BtiBgTOI5ffbewA77JPLpkN
X-Gm-Gg: AR+sD10B25u9AHDqnCi7U3lGZKsRhl81bH9k0wZhJvdIOuM5aDfovvmOwIpd6P9cVsV
	Dt+3vJTCLcHUfQjWHwCC/IykKOeny8YHOgJjyvIvB/yyr5Oszt/qR8gBAwnz0SQB7duOJ371WX8
	AS3RJ5h619QD5UYTdVndqGICVXB3io6gasQurCr/8fgBES0sCTw3hZCylSOa50AJ3OoC+O+dJDC
	G1hNRP577WLo3fK5eO/Sp3z3pSrm16ggRfUIqjqX3i7x7rcuslPUcsxfzDFZV5hHqthbt+M8kJo
	V2hDNPIK2SdwanV2e6UxRPPsfQ6Bui5QJg/DsZB15AlPyFnlASLXOekBrESKXGfa8Apv+4gtoaH
	brozh+dcDo1GKdor4Yy1dW2u5pXRVmM7fSQDKSsNGTueZQM1x66LtJ5kkSy49EOosqAPevjzCUT
	H9mzifEMZ6qQQ6ZW39Km5VCq0fugJ7WaETT8rAyeoIzzKw99Nwr1dDPrpQCeeayvk5wfvXLuDtn
	nuqSAu+0KqJCsFlNaJJ39BVhwffqw==
X-Received: by 2002:a17:902:e545:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2d0ca780473mr43369225ad.16.1785907310604;
        Tue, 04 Aug 2026 22:21:50 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bf3a:ac93:79c4:84fd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm10850397eec.12.2026.08.04.22.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 22:21:50 -0700 (PDT)
Date: Tue, 4 Aug 2026 22:21:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: rmi4 - honor touchscreen-{x,y}-mm
Message-ID: <anLH8cYpnvN_DYZu@google.com>
References: <20260731-respect-x-y-mm-v1-0-3e85a4bec745@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-respect-x-y-mm-v1-0-3e85a4bec745@ixit.cz>

Hi David,

On Fri, Jul 31, 2026 at 08:13:40PM +0200, David Heidelberg via B4 Relay wrote:
> This series ensures, that when invalid value is detected or mismatch
> between value defined in the device-tree and the read from the
> touchscreen is observed, the user is notified and zero is ignored.

This seems very complicated. If board maker specifies these parameters,
they probably want to use them instead of what the firmware reports. So
wouldn't it be simpler to not try to match and report differences but
rather skip querying hardware and use device properties if they are
specified?

Thanks.

-- 
Dmitry
