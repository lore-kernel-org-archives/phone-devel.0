Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6B63ECBFC
	for <phone-devel@vger.kernel.org>; Wed,  4 Feb 2026 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770204350; cv=none; b=O1siy3hlZ+FOkh+amh+G3nOpC0uJUZ/eLHgO+YsmR7XgQUViTqlhC5DgWXX/WA+wD73dn4LYKxp8ZGRD8uTiMDJpqhCiqSIHG5mcj05Kau+QDHD69W05otp5C+LC2INgxeUcTH1iOBNWZhez5fwWogQGQp1qlOAb197W0Xb3LYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770204350; c=relaxed/simple;
	bh=cHrIGCrLD2E71lxcn6R9T8rwGbDwPkRE47D0XFgJzv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKnTK7Q00/nBgRibqxlnrGIsaVfZzl5O9RB8shfi4zpL90P932smH37nhi5+UnZwY8ds5TzWQphnqnKhe1FyHiKUjUFbkLnB+ACy89m8CCKcxaNFnCtWpjQH/YlPymyxvubzAUuJO+WZvyVzIQ1Unay4LhxzODsrPJXK4k0VD2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNXIISo4; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNXIISo4"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1233b953bebso2618811c88.1
        for <phone-devel@vger.kernel.org>; Wed, 04 Feb 2026 03:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770204349; x=1770809149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mYrSGr/bgBDeAZ5X1xIVgbMDj6wzpB8qLVpSIaqJT/s=;
        b=eNXIISo4aQQIBQHdlO4XbwCqot0+VXtRPHNtKHFI+KFB2jiPqVYCUg71ZNyWmtzGgP
         wC4maQro0HfaHDjxJiy4vKxGZffOBxtO7EythNtQfHnuz/bMT8Rojp1Jrebvx8BRudY7
         B+mC6/km06Kx6RUxFlISKqYRNvXpMDgBqWZqqRBv2YOqva7GN53eVsS/KvQU+hfdHXSJ
         rAer8iEs9vYZ2jNTS2TkooAIlfgCQDl8NFToJnG7AHnGBP48rF8mVuPKnkK+27qUSmQ6
         uf1xL/D9/Yli3yanC1RS4+u+K5/5X0i/Fq6Vb5B08QglP9Vg3NkIlgufKhBD+PgzxxwA
         cQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770204349; x=1770809149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYrSGr/bgBDeAZ5X1xIVgbMDj6wzpB8qLVpSIaqJT/s=;
        b=ddykPpCj6160P3Tl+RQe3pdUz5LQUL/QkQQj5XBSK8n9SWRIYtrNyozo5AA9Sm7VcL
         zz76c35+QEFIXdYYLzD3H2ue644FAJBCXnKJUnwquDYl1sjUjd6nWY+j5WcSaWG7c3ae
         UDL5vHSGmGK5BTa4+cnkS4DCofiJGX6pjllEw5BJexNeiy7W83Dqi+tOQk5TQiS83xGb
         GPEuor5Xrywp6xKC+9IU5LxFI857Glhrw4qSwT85kQ/rHTmTusfnycTMlJZNtILcxEQv
         PadpOTfKuM8Pbf/geib2W0bRi16r9Vz4dRppFVn52O04nV9M8AUMkwQnXvb9EXLFW9Gf
         CF6g==
X-Forwarded-Encrypted: i=1; AJvYcCXDZ0b83TiPpR5fM18YXrtRQMsje+1FrvbTmUr8FkJhmoecuBNHcMpUqiF4c6XHR2pVplBvbDF1M4Nbjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwfJPi70O1YFH7o4cAd4Xkjs+K4W81p3K5YiLfHhEcRpRxUbTg
	VHocZcHnu1v4Ykk8huPl3tLJhQbGF8lk7GLj2OystvBFar5YO6UyhW7E
X-Gm-Gg: AZuq6aJ9Vk8kYYLuoB/iJQh4gslT1UkFDof0GWiG7xdye9WFRHDE2tvU/8JWRZS4gue
	lTNZVAm2clvzdgNWkwprX5AHkUCNoOfxy6clJV6DrCxubxrA41j3/k0vTOixcAmE8MZQoJIsLU+
	swcyq6R5/CEq6cIu0LMSMukQuMkz732/pouP4jfh0oRxcQaOOPrafCScAi123UH9hadKfL22uF0
	ViE6NteJL6X5rhe3y7hHAYWPKz6xbjeublN4F0MrRBVJbqkKCsMsUiyPYqhhrP9XK4A1+z+Mo6k
	i81w2n1koYUp8DlrcTgUtSE9Fxs3Htd0vfOsX8YmN9CQ2A1myKMNUa6xrJUYS2yPMN26J/KXt09
	LR85fowzMSfY4DewPYZCaM5e/AZZ4JZK0vo9AUUwrZYfQ1/wGWKG2l+Bg2vs5dHK/iBfaLpPjZX
	2OEjnPgUt87IZuKbRpx95j0kVQhihSWZXrYIeojJTEBCB3ViJI247R
X-Received: by 2002:a05:7022:325:b0:11d:e25a:d9ca with SMTP id a92af1059eb24-126f47bd21cmr998880c88.26.1770204349187;
        Wed, 04 Feb 2026 03:25:49 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:b789:f5e2:3597:9114])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e111efsm1602698c88.8.2026.02.04.03.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 03:25:48 -0800 (PST)
Date: Wed, 4 Feb 2026 03:25:45 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Raymond Hackley <raymondhackley@protonmail.com>
Cc: linux-kernel@vger.kernel.org, Markuss Broks <markuss.broks@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] dt-bindings: input: touchscreen: imagis: allow
 linux,keycodes for ist3038
Message-ID: <aYMsshqLbX3DfIO2@google.com>
References: <20251224100941.3356201-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224100941.3356201-1-raymondhackley@protonmail.com>

On Wed, Dec 24, 2025 at 10:10:48AM +0000, Raymond Hackley wrote:
> Imagis IST3038 provides touch keys. Allow linux,keycodes for ist3038.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>

Applied, thank you.

-- 
Dmitry
