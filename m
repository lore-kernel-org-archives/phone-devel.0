Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9B2D63F8
	for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421256; cv=pass; b=n8sfkOZ/+yirbziXN5UoHpPIDR6bagEc5RmskZLeAzmNDdL/mopnE/vmFoDiUHEkZPCC6xWGQj9PjEqBmSnuoSgFEq5VX4fChI6VJ6yBlRwO6AKqZBVarmq/9PoqmGKxXkKc/+ZBNk5yYGn2WmfMhRtBXCrIKwKkdQ/tLFDsTc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421256; c=relaxed/simple;
	bh=6uKgX+FTM0Qddb34IIko45XF60fCsP88ocn5fLnGK6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+LzeRLKkYrCkhQ0/PQLLDYaaVszL8LjG605zdKe8OzKA8bdby8TbhiuVKbbNXZ3VD20UNc1sPU32ScPyYoqQgkAIBZWnhZfu3Noymu3jU3Fk1UZn3ZUU9OrqGvVM2tPLX8gFbn10S9AjQNcYiqZPsvFwsRDVrJLfKDXLw6JyTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltzkSItT; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltzkSItT"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b6b0500e06so6230104eec.1
        for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 05:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771421254; cv=none;
        d=google.com; s=arc-20240605;
        b=PMSIepybO1RTPi+KtNlX/EpYu9C3+eFPH4gYfzGCFK5JKpsN7KTJvaTi29ka8N6L8I
         nZlN8kSi1wImDAwk1dg2lUlnXHjh1Aqhwdf/mdUFBSfN2V0S/emLFWJkReWgyC/u+5YQ
         0UP19DWFRDkReWMLiVBW56mzAkC07EgHCPLw5pRXW/Q+5s1WRPV3vobaM5UMjzvYWVK9
         5cN9Z/5dIZqr9MytPEmR44eiCH22GZPwqAZf3aQdtgU+NFEuleYrtMFA8bJjLmw2OnJw
         TfhY++seUHeWNfyr9zavuO1yJpa9acpt2WmkEV+FQdbG4cEjT5rOYOE8zTlDDEBxcqCA
         8Z2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VDwK81uO6Grpntsjm+/j+2ujVIp4zE8opmsr/kEY3iU=;
        fh=00XTwMEdDmXkLHcpaRsWhsmTU6FEAcc2qNXAiH7+NPs=;
        b=K8UeKMlnzjufVw8EIiSBWpLiGWS59qaeK8Ii9KA5Elb26ythTw2049hPdCMj4Yi2ao
         9oQ/nok2Fbkrq60ccZ4X3r++uYSg8iZANsbXNhcGCOBz0IQyCkXun0FBHXtGz1Ysn9S3
         vM12dGzFqKCKWIgNsw0zVUIdxfWcDNpjqWvBJNXDFQrbczQD1JXijGGiJhuih76fUp1N
         uZcs3D6EM+FiVHYgyMQD9Px85S+xoe5eBhhTUJLsxNxsstNK8CuivttxkqzHSuEkyUwk
         y0KBIwfI88dpHBaCePAV8vXLCPLmP/iAKVKOQ257tdimufrnduvHoxVmau2bX83ZdstL
         cl0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771421254; x=1772026054; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VDwK81uO6Grpntsjm+/j+2ujVIp4zE8opmsr/kEY3iU=;
        b=ltzkSItT7wAmsf0b7r/yLVheQw+py8oHM8yGNywbF3/OKslGCTRxKg40Kv9Ads58AK
         ASTxvguu9gvupJGRlrJ/NJvX3FP8fI4moOab7E1iS4OOamS0MulmrdfniZhyHfTGGJiQ
         AU/00fa60cAg/keg5Jv49AOfQ2tQoLNq6bLv8Jkv0LqCxwnhWiD8dUCiLpKoj+zndtyq
         hcoNp3nWlOmpjS+fhm8Pv1p9sXtI4yJtRG2IFr5uUKSpHAY2tAO4lDTw0nqquu6LTxc7
         PriY1vQqIfHK+bUse/DNGztxuEBogiS/844rGetZwUwXlcMFzA/jrJ3Ntef/hr4xEDFb
         /sZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771421254; x=1772026054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDwK81uO6Grpntsjm+/j+2ujVIp4zE8opmsr/kEY3iU=;
        b=QrSu2Zy13DwrdgYyZbMctMBoY7E/LiDUkn1WAuyu6uhAsFyU7NhwLO1O2ubx+ndEMV
         a16bzOF/KW3d7xZk07TIYMUmhkwRBj0rCzDTQvKrU3BRyyzLriI5CX7fH0t4aqPf/lgZ
         V3Yy8Iu3GYdftiDxeyxiUHXIxqUrRktSxNuOVmnFChVQJcR4v/6vYSV8JDnVCmokfnKo
         fuKyzsfkufKdbMhPMRy2gf7ww71fT058IXmw26QCIcn7KA8GTv3gjQK8XANgSNd8OaRR
         B7ByWvshLyE5PMbrcADSRn8Qh1xTt6vKWiO3XCHPFSUoECzTMyJii+7i6Qls6DykQedG
         mkaA==
X-Forwarded-Encrypted: i=1; AJvYcCUGsiyIbxAWDb/tqzED9eG8OO2yb2j7aFeEHI+Xaj232b608HEjtG+eS5WaDcvFFr2CydMhbK5mt3wEBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbodtOtsR4EgUYXeZSnmDb3c3DZzR4rwqAW9mHbKV1gGGzoOI
	r3T5P8cJ+0OGxvmv8UGze5AE6TwVoDpslRhjwCP8SKFWkYQcO0HAc7snl3SFBV1bv9aC3+TeU0k
	cCzO+C31YLOAwIRvPefE+hltfEUl59fI=
X-Gm-Gg: AZuq6aJrbGff2YtkELed8ewIpAEz9AbLDEZWNxC26Dju5cz7J+tW3/g4p1H1DKN8Bbz
	5zCXz5WGEd1gSdb3RkH5VjRoPQXPCK/D9fXjj7oK9meXFw5IQiu58uP5UltcnpDlhnnT/+c/CJE
	PhO0sHFmOnYVjZrF8vQcevKJsHgEPi/zWYHjJAUCJGDAi9CErUZcBBiS78TVMISfDv8wPbXmn7k
	jC+AnWUubipEwVk7qZR9AA0MzvdYnKRQdBFceKcW/My+w4eD3Dwn+1nS2nLyz6Z0BCmO3o1aLO9
	yTMYcA==
X-Received: by 2002:a05:7301:d19:b0:2ba:6d87:cf68 with SMTP id
 5a478bee46e88-2baba05b5c2mr8036941eec.16.1771421254003; Wed, 18 Feb 2026
 05:27:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHuF_ZqWTb5Z7J10WQaBR2adVi1rU-ZFFTCBkHh6nNtuuCdJDQ@mail.gmail.com>
 <975930a0-1ad6-4b3f-ba3f-13f6f79322e6@kernel.org>
In-Reply-To: <975930a0-1ad6-4b3f-ba3f-13f6f79322e6@kernel.org>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 18 Feb 2026 15:27:22 +0200
X-Gm-Features: AaiRm506tq3L5Z3tHq7u7PFOBpp3iK-Ike8T0d94DU02cYJ-d0FeBWZ88LSnJGc
Message-ID: <CAHuF_Zr7r-x_ov=PMf7KmKEuApis5+eQamxGkcKSh7Y=onr=gA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: val@packett.cool, andersson@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marijn.suijten@somainline.org, martin.botka@somainline.org, 
	mturquette@baylibre.com, phone-devel@vger.kernel.org, robh@kernel.org, 
	sboyd@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Feb 2026 at 21:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 17/02/2026 19:51, Yedaya Katsman wrote:
> > On Mon, Feb 16, 2026 at 08:25:20PM -0300, Val Packett wrote:
> >> Add the missing defines for MDSS resets.
> >> While here, align comment style with other SoCs.
> >>
> >> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> >> Signed-off-by: Val Packett <val@packett.cool>
> >> ---
> >>  include/dt-bindings/clock/qcom,dispcc-sm6125.h | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > Tested-By: Yedaya Katsman <yedaya.ka@gmail.com>
>
> Thanks for the efforts, but unfortunately you cannot test a header. It
> is not possible. Testing means you try given code on a REAL device and
> you cannot do that for the header or bindings.
>
> Please do not add tags which are not representing actual action.

OK, yeah that makes sense. I will send a tag for the last patch, which
only with it applied actually fixed my issue (although presumably it
depends on some of the previous ones in the series).

> Best regards,
> Krzysztof

Thanks, Yedaya
